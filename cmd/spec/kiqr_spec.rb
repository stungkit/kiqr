# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Kiqr::Cli', type: :feature do
  it 'loads version number' do
    expect(Kiqr.version).not_to eq(nil)
  end
end
