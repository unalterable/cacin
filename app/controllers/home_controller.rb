class HomeController < ApplicationController

  def index
    @events = Event.where("date >= :now", {now: Date.today})
  end

  def rsvp
    if params[:token] && token_record = MemberToken.find_by(token: params[:token])
      @token = token_record.token
      @member = token_record.member
    else
      redirect_to '/sign_up'
    end
  end

  def rsvp_update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to rsvp_path(token: params[:token]), notice: 'Member was successfully updated.'
    else
      render :edit
    end

  end

  def show
  end

  def about_us
  end

  private

    def member_params
      params.require(:member).permit(:title, :first_name, :last_name, :job_title, :organisation, :email)
    end

end
