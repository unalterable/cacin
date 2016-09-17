class Admin::MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  def import
    before = Member.count
    Member.import_csv(params[:file])
    after = Member.count
    redirect_to admin_members_path, notice: "#{after-before} members added. Maybe more updated."
  end

  def export
    send_data Member.to_csv, filename: "users-#{Date.today}.csv"
  end
  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to admin_member_path(@member), notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to admin_member_path(@member), notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    i = 0
    @member.event_mail_logs.each do |record|
      record.destroy
      i += 1
    end
    @member.member_tokens.each do |record|
      record.destroy
      i += 1
    end
    @member.rsvps.each do |record|
      record.destroy
      i += 1
    end
    @member.destroy;
    redirect_to admin_members_url, notice: "Member and #{i} associated records (EventMailLogs MemberTokens Rsvps) were successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:title, :first_name, :last_name, :job_title, :organisation, :email)
    end
end
