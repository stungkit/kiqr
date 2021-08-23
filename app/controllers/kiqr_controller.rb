class KiqrController < ApplicationController
  before_action :authenticate_user!

  def after_account_switched_path(*)
    root_path
  end

  def after_account_created_path(*)
    account_switch_path(@account)
  end
end
