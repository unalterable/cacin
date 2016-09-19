class Admin::EventMailLogsController < ApplicationController

  def index
    @event_mail_logs = EventMail.all.map(&:logs).flatten
  end

end
