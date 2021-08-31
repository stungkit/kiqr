# frozen_string_literal: true

require 'factory_bot'
require 'faker'

Dir["#{File.dirname(__FILE__)}/factories/**"].each do |f|
  load File.expand_path(f)
end
