module CurrentHelper
  def current_account
    return if Current.account.blank?

    Current.account
  end
end
