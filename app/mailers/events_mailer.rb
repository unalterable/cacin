class EventsMailer < ApplicationMailer

  default from: 'CACIN Events <events@cacin.co.uk>'

  def invitation(to, subj, html, text)
    mail(to: to, subject: subj) do |format|
      format.html{ render( html: html.html_safe ) }
      format.text{ render( text: text) }
    end
  end

end
