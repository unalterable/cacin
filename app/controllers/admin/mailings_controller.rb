class Admin::MailingsController < ApplicationController
  before_action :set_event_mail, only: [:show, :sender, :edit, :update, :destroy]

  # GET /admin/mailings
  # GET /admin/mailings.json
  def index
    @event_mails = EventMail.order(id: :desc)
  end

  # GET /admin/mailings/1
  # GET /admin/mailings/1.json
  def show
    @members = Member.all
  end

  def sender
    members = params['members'] ? Member.find(params['members']) : []
    EventMailingJob.perform_later(@event_mail, members)
    redirect_to admin_mailing_path(@event_mail), notice: "Mailing was successfully sent to #{members.count} members."
  end

  # GET /admin/mailings/new
  def new
    @event_mail = EventMail.new
  end

  # GET /admin/mailings/1/edit
  def edit
  end

  # POST /admin/mailings
  # POST /admin/mailings.json
  def create
    @event_mail = EventMail.new(event_mail_params)
    if @event_mail.save
      redirect_to admin_mailing_path(@event_mail), notice: 'Mailing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/mailings/1
  # PATCH/PUT /admin/mailings/1.json
  def update
    if @event_mail.update(event_mail_params)
      redirect_to admin_mailing_path(@event_mail), notice: 'Mailing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/mailings/1
  # DELETE /admin/mailings/1.json
  def destroy
    @event_mail.destroy
    redirect_to admin_mailings_path, notice: 'Mailing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_mail
      @event_mail = EventMail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_mail_params
      params.require(:event_mail).permit(:event_id, :name, :subject, :includes_rsvp, :html_template, :plain_text_template)
    end
end
