class KiqrController < ApplicationController
  before_action :authenticate_user!

  def after_account_switched_path(*)
    root_path
  end
end
