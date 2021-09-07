# frozen_string_literal: true

module Kiqr
  class MembersController < KiqrController
    load_and_authorize_resource

    before_action :set_account
    before_action :set_member, only: %i[edit update]
    helper_method :options_for_role

    # GET /account/members
    def index
      @members = @account.members.includes(:user).references(:user)
      respond_with(@members)
    end

    # GET /account/members/new
    def new
      @member = @account.members.new
      respond_with(@member)
    end

    # GET /account/members/:id/edit
    def edit
      respond_with(@member)
    end

    # POST /account/members
    def create
      @member = @account.members.new(create_params)
      set_flash_message(:notice, :created) if @member.save
      respond_with @member, location: members_path
    end

    # PATCH/PUT /account/members
    def update
      @member.update(update_params)
      set_flash_message(:notice, :updated) if @account.errors.blank?
      respond_with @member, location: members_path
    end

    # Array of options for role select in views.
    def options_for_role
      Member::AVAILABLE_ROLES.map { |role| [role.capitalize, role] }
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.accounts.find(current_account.id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = @account.members.find(params[:id])
    end

    # Only allow a list of trusted create parameters through.
    def create_params
      params.require(:member).permit(:role, :invitee_email)
    end

    # Only allow a list of trusted update parameters through.
    def update_params
      params.require(:member).permit(:role, :invitee_email)
    end
  end
end
