class EventMailingJob < ApplicationJob
  queue_as :default

  ADMIN_NOTIFY_FREQ = 20

  def perform(event_mail, members)
    @event_mail = event_mail
    @members = members
    @started_at = Time.now

    flagEventMailAsSent
    @members.each_with_index do |member, i|
      email_member(member)
      notify_admin(i, member)
    end
  end

  private

    def flagEventMailAsSent
      @event_mail.update(sent: true) unless @event_mail.sent
    end

    def email_member(member)
      create_email(member).deliver_later
    end

    def create_email(member)
      token = get_rsvp_token(member) if @event_mail.includes_rsvp
      EventMailer.invitation(member, @event_mail, token)
    end

    def get_rsvp_token(member)
      MemberToken.find_or_create_by( member: member,
                          rsvp: get_rsvp(member, @event_mail.event),
                          notes: token_notes)
    end

    def get_rsvp(member, event)
      Rsvp.find_or_create_by( member: member,
                              event: event)
    end

    def token_notes
      "Created at #{ Time.now } in the mailing of '##{ @event_mail.id }: #{ @event_mail.name }'"
    end

    def notify_admin(i, member)
      (@membersSinceNotify ||= []) << member
      if i+1 == @members.count
        sendAdminEmail("All of #{ @members.count } complete!", @members)
      elsif (i+1) % ADMIN_NOTIFY_FREQ == 0
        sendAdminEmail("#{i+2 - @membersSinceNotify.count}-#{ i+1 } of #{@members.count} complete", @membersSinceNotify)
        @membersSinceNotify = []
      end
    end

    def sendAdminEmail( progress, sentMembers )
      ApplicationMailer.email_admin("
      Mailing Notification for mailing started at: #{ @started_at }
      <br /><br />
      #{ progress }
      <br /><br /><hr><br /><br />
      Sent to:
      <br /><br />
      #{ sentMembers.map do |m|
        "#{ @members.find_index(m)+1 }: ##{m.id} | #{m.first_name} #{m.last_name} | #{m.email}<br />"
      end.join || "No one" }
      <br /><hr><br /><br />
      #{@event_mail.html_template}
      ").deliver_later
    end

end
