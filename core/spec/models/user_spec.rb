# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe User, type: :model do
    # subject(:user) { create(:user) }
    it { should have_many(:accounts).through(:members) }

    pending 'should not be able to destroy if owner of an account'
  end
end
