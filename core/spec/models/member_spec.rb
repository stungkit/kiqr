# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe Member, type: :model do
    subject(:member) { create(:member) }

    describe 'associations' do
      it { should belong_to(:user) }
      it { should belong_to(:account) }
    end

    describe 'validations' do
      it { should allow_values('member', 'admin').for(:role) }
      it { should_not allow_values('foo', 'bar').for(:role) }

      it { should allow_values('valid@mail.com').for(:invitee_email) }
      it { should_not allow_values('invalid@9xijn9ijxi9okiaf.com').for(:invitee_email) }

      pending 'should not allow the same user to be a member more than once (uniqueness with scope)'
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
