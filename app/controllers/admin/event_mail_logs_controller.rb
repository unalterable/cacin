class Admin::EventMailLogsController < ApplicationController

  def index
    @event_mail_logs = EventMailLog.all
  end
  
end
