class EventMailer < ApplicationMailer
  after_action :log

  def invitation(member, event_mail, member_token = nil)
    @member = member
    @event_mail = event_mail
    @member_token = member_token
    basic_email(  to: to,
                  subject: subject,
                  html: html,
                  plain_text: plain_text)
  end

  private

  # def from
  #   @event_mail
  # end

    def to
      @member.email
    end

    def subject
      @event_mail.subject
    end

    def html
      @event_mail.render_html(member: @member,
                              member_token: @member_token)
    end

    def plain_text
      @event_mail.render_plain_text(member: @member,
                              member_token: @member_token)
    end

    def log
      EventMailLog.create(member: @member, event_mail: @event_mail, member_token: @member_token)
    end

end
