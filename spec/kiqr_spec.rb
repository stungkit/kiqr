# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Kiqr', type: :feature do
  it 'loads version number' do
    expect(Kiqr::VERSION).not_to eq(nil)
  end
end
