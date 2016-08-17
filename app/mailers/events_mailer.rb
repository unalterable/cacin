class EventsMailer < ApplicationMailer
  def invitation(to, subj, html, text)
    mail(to: to, subject: subj) do |format|
      format.html{ render(html: html)}
      format.text{ render(text: text)}      
    end
end
