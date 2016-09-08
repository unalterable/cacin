class ApplicationMailer < ActionMailer::Base
  default from: Figaro.env.events_email
  layout 'mailer'

  after_action :pause

  PAUSE_LENGTH = 60 #seconds

  def basic_email(args)
    mail( args.slice(:to, :subject) ) do |format|
      format.html{render( html: args[:html].html_safe )}
      format.text{render( text: args[:text] )}
    end
  end

  def email_admin(note)
    basic_email(to: Figaro.env.admin_email,
                subject: "Admin Notification from #{root_url}",
                html: note,
                text: note )
  end


  private

    def pause
      puts "Email rendererd, pending send. Pausing: #{ PAUSE_LENGTH }secs..."
      sleep(PAUSE_LENGTH)
      puts "Email. Pausing finished."
    end

end
