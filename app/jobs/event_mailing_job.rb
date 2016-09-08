class EventMailingJob < ApplicationJob
  queue_as :default

  ADMIN_NOTIFICATION_FREQ = 10

  def perform(event_mail, members)
    @event_mail = event_mail
    @members = members
    @members.each_with_index do |member, i|
      notify_admin(i) if i%ADMIN_NOTIFICATION_FREQ == 0
      email_member(member)
    end
    notify_admin("ALL")
  end

  private

    def email_member(member)
      create_email(member).deliver_later
    end

    def create_email(member)
      token = get_rsvp_token(member) if @event_mail.includes_rsvp
      EventMailer.invitation(member, @event_mail, token)
    end

    def get_rsvp_token(member)
      MemberToken.create( member: member,
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

    def notify_admin(index)
      ApplicationMailer.email_admin("MAILING NOTIFICATION:\n\n<br /><br /><hr><br /><br /> \n\n#{index} of #{@members.count} complete\n\n<br /><br /><hr><br /><br /> \n\n#{@event_mail.html_template}").deliver_later
    end

end
