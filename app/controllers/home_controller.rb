class HomeController < ApplicationController

  # GET /events
  def index
    @events = Event.where("date >= :now", {now: Date.today})
  end

  # GET /events/1
  def show
  end

  def about_us
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
    end

end
