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
end
