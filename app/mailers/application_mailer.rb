class ApplicationMailer < ActionMailer::Base
  default from: 'events@cacin.co.uk'
  layout 'mailer'

  after_action :pause

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
      puts "=============="
      puts "Pausing after email: "
      5.times do |x|
        puts 5 - x
        sleep(1)
      end
      puts "=============="
    end

end
