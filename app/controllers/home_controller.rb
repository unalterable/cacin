class HomeController < ApplicationController
  before_action :validate_token, only: [:rsvp, :rsvp_update]

  def index
    @events = Event.where("date >= :now", {now: Date.today})
  end

  def about_us
  end

  def rsvp
  end

  def sign_up
    @member = Member.new
  end

  def rsvp_update
    @rsvp.status = params[:rsvp]
    if @member.update(member_params)
      @rsvp.save
      redirect_to rsvp_path(token: params[:token]), notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  def new_member
    @member = Member.new(member_params)
    if @member.save
      redirect_to root_path, notice: 'Member was successfully created.'
    else
      render :sign_up
    end
  end

  def request_token_email
    member = Member.find_by(email: params[:email])
    token = MemberToken.new(member: member)
    if token.save
      MemberMailer.token_link(token).deliver_later
      redirect_to root_path, notice: "Email has been sent to #{ params[:email] }"
    else
      redirect_to root_path, notice: "There has been an error. The email did not send. Please contact the system administrator."
    end
  end


  private

    def member_params
      params.require(:member).permit(:title, :first_name, :last_name, :job_title, :organisation, :email)
    end

    def validate_token
      if params[:token] && token_record = MemberToken.find_by(token: params[:token])
        @token = token_record.token
        @member = token_record.member
        @rsvp = token_record.rsvp
        @event = @rsvp.event
      else
        redirect_to '/sign_up'
      end
    end

end
