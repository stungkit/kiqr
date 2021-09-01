#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'dry/cli'

require 'kiqr/version'
require 'kiqr/commands/new'
require 'kiqr/commands/version'

module Kiqr
  module Commands
    extend Dry::CLI::Registry

    register 'new', NewApplication
    register 'version', Version, aliases: ['v', '-v', '--version']
  end
end

Dry::CLI.new(Kiqr::Commands).call
