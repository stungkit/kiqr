# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Kiqr::Auth::Devise', type: :feature do
  it 'loads version number' do
    expect(Kiqr::Auth::Devise.version).not_to eq(nil)
  end
end
