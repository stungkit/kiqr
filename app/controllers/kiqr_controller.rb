class KiqrController < Kiqr.config.parent_controller.constantize
  before_action :authenticate_user!

  def after_account_switched_path(_account)
    root_path
  end

  def after_account_created_path(account)
    switch_account_path(account)
  end

  def after_account_setup_path(_account)
    root_path
  end

  private

  def set_account
    @account = current_account
  end

  def account_params
    params.require(:account).permit(:name, :billing_email)
  end
end
