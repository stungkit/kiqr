# frozen_string_literal: true

module Kiqr
  class AccountsController < KiqrController
    before_action :set_account, only: %i[edit update]
    skip_before_action :authenticate_account!, only: %i[new create switch]
    before_action :authenticate_user!, only: %i[new create switch]

    def index
      redirect_to edit_account_path
    end

    # GET /account/new
    def new
      @account = current_user.accounts.new
    end

    # GET /account/edit
    def edit; end

    # POST /account
    def create
      @account = current_user.accounts.build(account_params.merge(owner: current_user))
      @account.members.build(user: current_user)

      if @account.save
        set_flash_message(:notice, :created)
        switch
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH /account
    def update
      @account.update(account_params)
      set_flash_message(:notice, :updated) if @account.errors.blank?
      respond_with @account, location: after_account_updated_path
    end

    # GET/PATCH /account/switch/:id
    def switch
      @account ||= current_user.accounts.find(params[:id])
      session[:account_id] = @account.id
      redirect_to after_account_switched_path
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.accounts.find(current_account.id)
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :billing_email, :personal)
    end
  end
end
