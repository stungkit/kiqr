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
        flash[:notice] = I18n.t('kiqr.accounts.created', account_name: @account.name)
        redirect_to after_account_created_path(@account)
      else
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('new_account', partial: 'form') }
          format.html { render :new }
        end
      end
    end

    def switch
      @account = current_user.accounts.find(params[:id])
      current_user.update(account: @account)

      flash[:notice] = I18n.t('kiqr.accounts.switched', account_name: @account.name)
      redirect_to after_account_switched_path(@account), fallback_location: root_path
    end

    private

    def account_params
      params.require(:account).permit(:name)
    end
  end
end
