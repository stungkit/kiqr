# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe Account, type: :model do
    describe 'associations' do
      it { should have_many(:users) }
      it { should belong_to(:owner).class_name('User') }
    end

    describe 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:billing_email) }
      it { should allow_values('valid@mail.com').for(:billing_email) }
      it { should_not allow_values('invalid@9xijn9ijxi9okiaf.com').for(:billing_email) }
    end
  end
end
