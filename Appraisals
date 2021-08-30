# frozen_string_literal: true

appraise 'rails_6_0_3' do
  gem 'rails', '~> 6.0.3'
end

appraise 'rails_6_1' do
  gem 'rails', '~> 6.1'
end

appraise 'rails_master' do
  gem 'rails', github: 'rails/rails'

  # Temporary patch for Devise until merged to Devise, to get rid
  # of issues with ActiveSupport::Dependencies
  gem 'devise', github: 'strobilomyces/devise', ref: 'patch-1'
end
