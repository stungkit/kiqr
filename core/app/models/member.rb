# frozen_string_literal: true

class Member < ApplicationRecord
  include Kiqr::Models::Member

  AVAILABLE_ROLES = %w[member admin].freeze
  FIRST_USER_ROLE = 'admin' # Default role for the user who created the account.
end
