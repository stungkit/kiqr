module Kiqr
  class AccountsController < KiqrController
    def index
      @accounts = current_user.accounts
    end

    def switch
      @account = current_user.accounts.find(params[:account_id])
      current_user.update(account: @account)

      redirect_to after_account_switched_path(@account), fallback_location: root_path
    end
  end
end
