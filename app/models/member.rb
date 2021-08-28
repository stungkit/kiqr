class Member < ApplicationRecord
  include Kiqr::Models::Member

  AVAILABLE_ROLES = %i[member admin].freeze
  FIRST_USER_ROLE = :admin # Default role for the user who created the account.
end
