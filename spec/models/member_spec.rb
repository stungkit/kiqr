# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe Member, type: :model do
    pending 'belongs to user'
    pending 'belongs to account'
    pending 'sets default role to FIRST_USER_ROLE on create'
    pending 'validates role exists in AVAILABLE_ROLES'
    pending 'can check if it has a specific role with role?(role)'
  end
end
