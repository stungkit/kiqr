# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe User, type: :model do
    pending 'load Kiqr::Models::User concern'
    pending 'has many accounts'
    pending 'creates personal account on create'
    pending 'should be undestroyable if owner of a team with an active subscription'
    it { should belong_to(:account) }
  end
end
