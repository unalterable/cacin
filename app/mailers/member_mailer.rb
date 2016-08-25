class MemberMailer < ApplicationMailer

  default from: 'CACIN Events <events@cacin.co.uk>'

  before_action :pause

  def invitation(args)
    email( args.slice(:to, :subject, :html, :text) )
  end

  def token_link(token)
    email(  to: token.member.email,
            subject: "CACIN: request to alter details",
            html: "You (or someone claiming to have your email address) have reqested to alter your CACIN member details.
            <br>
            Please click <a href='#{rsvp_url(token: token.token)}'>here</a> to edit your details",
            text: "You (or someone claiming to have your email address) have reqested to alter your CACIN member details.
            To edit your details please go here: #{rsvp_url(token: token.token)}" )
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
