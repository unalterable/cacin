class EventMailingJob < ApplicationJob
  queue_as :default

  def perform(event_mail, members)
    @event_mail = event_mail
    members.each do |member|
      create_email(member).deliver_later
    end
  end

  private

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

end
