class MemberMailer < ApplicationMailer

  def token_link(token)
    basic_email(
            to: token.member.email,
            subject: "CACIN: request to alter details",
            html: "You (or someone claiming to have your email address) have requested to alter your CACIN member details.
            <br>
            Please click <a href='#{rsvp_url(token: token.token)}'>here</a> to edit your details",
            text: "You (or someone claiming to have your email address) have requested to alter your CACIN member details.
            To edit your details please go here: #{rsvp_url(token: token.token)}" )
  end

end
