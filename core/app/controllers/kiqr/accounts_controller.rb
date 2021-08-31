# frozen_string_literal: true

module Kiqr
  class AccountsController < KiqrController
    before_action :set_account, only: %i[edit update setup]
    skip_before_action :redirect_to_account_setup, only: %i[new create setup update switch]

    def index
      redirect_to edit_account_path
    end

    # GET /account/new
    def new
      @account = current_user.accounts.new
    end

    # GET /account/setup
    def setup
      redirect_to edit_account_path unless @account.pending_setup?
    end

    # GET /account/edit
    def edit; end

    # POST /account
    def create
      @account = current_user.accounts.build(account_params.merge(owner: current_user))
      @account.members.new(user: current_user)

      if @account.save
        set_flash_message(:notice, :created)
        switch
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH /account
    def update
      location, flash_key = location_and_flash_key_for_update
      @account.update(account_params)
      set_flash_message(:notice, flash_key) if @account.errors.blank?
      respond_with @account, location: location
    end

    # GET/PATCH /account/switch/:id
    def switch
      @account ||= current_user.accounts.find(params[:id])
      session[:account_id] = @account.id
      redirect_to after_account_switched_path
    end

    private

    # Since the update endpoint is shared by both edit and setup. We'll need to
    # return different a location and flash message depending on if the account is
    # edited or if we're on our account setup.
    def location_and_flash_key_for_update
      @account.pending_setup? ? [after_account_setup_path, :after_setup] : [after_account_updated_path, :updated]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.accounts.find(current_account.id)
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :billing_email)
    end
  end
end
