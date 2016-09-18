class HomeController < ApplicationController
  before_action :validate_token, only: [:rsvp, :rsvp_update]

  before_action :set_upcoming_events, only: [:index, :rsvp, :rsvp_update]

  def index
  end

  def contact_us
  end

  def sign_up
    @member = Member.new
  end

  def email_admin
    ApplicationMailer.email_admin("Email to Admin:<br /><br />
    #{ params[:email_body] }").deliver_later
    redirect_to about_us_path, notice: "Your email was successfully sent to the CACIN Director."
  end

  def rsvp
    @member = @token.member
    @token.add_notes( "Used to validate member" )

  end

  def rsvp_update
    if @member.update(member_params)
      @rsvps = params[:rsvps].map do |rsvp|
        new_rsvp = Rsvp.find_or_create_by(member: @member, event_id: rsvp[:event_id])
        new_rsvp.update(status: rsvp[:status])
        new_rsvp
      end
      redirect_to rsvp_path(token: params[:token]), notice: 'RSVP was saved successfully.'
    else
      render :rsvp
    end
  end

  def new_member
    @member = Member.new(member_params)
    @member.member_input = true
    if @member.save
      sendInvitationsIfAnyAreLive
      redirect_to root_path, notice: "#{@member.first_name} #{@member.last_name}, you have successfully signed up."
    else
      render :sign_up
    end
  end

  def request_token_email
    member = Member.find_by(email: params[:email])
    token = MemberToken.new(member: member)
    if token.save
      token.add_notes( "Used in mailing a change of details token, requested by user" )
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
        @token = token_record
        @member = @token.member
        @token.add_notes( "Used to validate member" )
        @member.member_input = true
      else
        redirect_to '/sign_up'
      end
    end

    def sendInvitationsIfAnyAreLive
      Event.where("date >= :now", {now: Date.today}).each do |event|
        event.event_mails.each do |event_mail|
          EventMailingJob.perform_later( event_mail, [@member] ) if event_mail.sent
        end
      end
    end

    def set_upcoming_events
      @events = Event.where("date >= :now", {now: Date.today})
    end

end
