# frozen_string_literal: true

module Kiqr
  class MembersController < KiqrController
    load_and_authorize_resource
    before_action :set_account

    # GET /account/members
    def index
      @members = @account.members.includes(:user).references(:user)
      respond_with(@members)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.accounts.find(current_account.id)
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:role)
    end
  end
end
