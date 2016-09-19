class Admin::EventMailLogsController < ApplicationController

  def index
    @logs = EventMail.all.map(&:logs).flatten
  end

end
