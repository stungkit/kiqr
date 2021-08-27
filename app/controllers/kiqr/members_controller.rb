module Kiqr
  class MembersController < KiqrController
    before_action :set_account

    def index
      @members = @account.members.includes(:user).references(:user)
    end
  end
end
