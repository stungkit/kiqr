class Member < ApplicationRecord
  include Kiqr::Models::Member
  AVAILABLE_ROLES = %i[member admin].freeze
end
