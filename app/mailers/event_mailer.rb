class EventMailer < ApplicationMailer
  after_action :log

  def invitation(member, event_mail, member_token)
    @member = member
    @event_mail = event_mail
    @member_token = member_token
    basic_email(to: @member.email
                subject: @event_mail.subject
                html: @event_mail.html
                plain_text: @event_mail.plain_text)
  end

  private

    def log
      EventEmailLog.create(member: @member, event_mail: @event_mail, member_token: @member_token)


end
