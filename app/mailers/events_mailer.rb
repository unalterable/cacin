class EventsMailer < ApplicationMailer

  default from: 'CACIN Events <events@cacin.co.uk>'

  before_action :pause

  def invitation(args)
    email( args.slice(:to, :subject, :html, :text) )
  end

  private

    def email(args)
      mail( args.slice(:to, :subject) ) do |format|
        format.html{render( html: args[:html].html_safe )}
        format.text{render( text: args[:text] )}
      end
    end

    def pause
      puts "=============="
      puts "Pausing before email: "
      5.times do |x|
        puts 5 - x
        sleep(1)
      end
      puts "=============="
    end

end
