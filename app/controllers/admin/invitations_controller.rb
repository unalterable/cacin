class Admin::InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /invitations
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/1
  def show
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # GET /invitations/1/edit
  def edit
  end

  # POST /invitations
  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      redirect_to admin_invitation_path(@invitation), notice: 'Invitation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /invitations/1
  def update
    if @invitation.update(invitation_params)
      redirect_to admin_invitation_path(@invitation), notice: 'Invitation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invitations/1
  def destroy
    @invitation.destroy
    redirect_to admin_invitations_url, notice: 'Invitation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invitation_params
      params.require(:invitation).permit(:name, :notes, :html, :plain_text, :event_id)
    end
end
