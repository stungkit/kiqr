# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe User, type: :model do
    pending 'kiqr does not break devise user creation'
    pending 'should be undestroyable if owner of a team with an active subscription'

    it { should belong_to(:account) }
    it { should have_many(:accounts).through(:members) }
  end
end
