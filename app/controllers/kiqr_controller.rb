class KiqrController < Kiqr.parent_controller.constantize
  before_action :authenticate_user!

  def after_account_switched_path(*)
    root_path
  end

  def after_account_created_path(*)
    switch_account_path(@account)
  end
end
