module Kiqr
  class MembersController < KiqrController
    load_and_authorize_resource
    before_action :set_account

    def index
      @members = @account.members.includes(:user).references(:user)
    end

    def roles_collection
      Member::AVAILABLE_ROLES.map do |role|
        ["#{role}_ability".classify.constantize.role_name.capitalize, role]
      end
    end
    helper_method :roles_collection
  end
end
