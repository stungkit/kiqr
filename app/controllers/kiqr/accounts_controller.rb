module Kiqr
  class AccountsController < KiqrController
    before_action :set_account, only: %i[edit update setup]
    skip_before_action :redirect_to_account_setup

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

    def setup
      redirect_to edit_account_path unless @account.pending_setup?
    end

    def edit; end

    def update
      is_setting_up = @account.pending_setup?

      if @account.update(account_params)
        flash[:notice] = (is_setting_up ? I18n.t('kiqr.accounts.after_setup') : I18n.t('kiqr.accounts.updated'))
        redirect_to(is_setting_up ? after_account_setup_path(@account) : edit_account_path)
      else
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace("edit_account_#{@account.id}", partial: 'form') }
          format.html { render(is_setting_up? ? :setup : :edit) }
        end
      end
    end

    def switch
      @account = current_user.accounts.find(params[:id])
      session[:account_id] = @account.id
      flash[:notice] = I18n.t('kiqr.accounts.switched', account_name: @account.name)
      redirect_to after_account_switched_path(@account)
    end
  end
end
