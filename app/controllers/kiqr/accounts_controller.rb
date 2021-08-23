module Kiqr
  class AccountsController < KiqrController
    def index
      @accounts = current_user.accounts
    end

    def new
      @account = current_user.accounts.new
    end

    def create
      @account = current_user.accounts.new(account_params.merge(owner: current_user))
      @account.members.new(user: current_user)

      if @account.save
        redirect_to after_account_created_path(@account), notice: 'Your new account was successfully created!'
      else
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('new_account', partial: 'form') }
          format.html { render :new }
        end
      end
    end

    def switch
      @account = current_user.accounts.find(params[:account_id])
      current_user.update(account: @account)

      redirect_to after_account_switched_path(@account), fallback_location: root_path
    end

    private

    def account_params
      params.require(:account).permit(:name)
    end
  end
end
