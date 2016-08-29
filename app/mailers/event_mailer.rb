class EventMailer < ApplicationMailer
  def invitation(args)
    basic_email( args.slice(:to, :subject, :html, :text) )
  end
end
