# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe Member, type: :model do
    subject(:member) { create(:member) }

    describe 'associations' do
      it { should belong_to(:user) }
      it { should belong_to(:account) }
    end

    it 'sets default role to FIRST_USER_ROLE on create' do
      expect(member.role).to eq(Member::FIRST_USER_ROLE)
    end

    # rubocop:disable RSpec/PredicateMatcher
    it 'can check if it has a specific role with role?(role)' do
      expect(member.role?(Member::FIRST_USER_ROLE)).to be_truthy
    end
    # rubocop:enable RSpec/PredicateMatcher
  end
end
