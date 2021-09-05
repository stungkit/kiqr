# frozen_string_literal: true

require 'factory_bot'
require 'faker'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

Dir["#{File.dirname(__FILE__)}/factories/**"].each do |f|
  load File.expand_path(f)
end
