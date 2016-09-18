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
      member.add_notes("Sending EventMail ##{ @event_mail.id }: QUEUED")
    end

    def create_email(member)
      EventMailer.invitation(member, @event_mail)
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
