# frozen_string_literal: true

require 'bundler/setup'
require 'rubocop/rake_task'

$LOAD_PATH.unshift File.dirname(__FILE__)

KIQR_GEMS = %w[core devise cmd].freeze

require 'tasks/update_versions'
require 'tasks/bundle'
require 'tasks/clean'
require 'tasks/gem'
require 'tasks/sandbox'

task default: %i[rubocop spec]

desc 'Run rubocop tests.'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end

%w[spec].each do |task_name|
  desc "Run #{task_name} task for all projects"
  task task_name do
    errors = []
    KIQR_GEMS.each do |project|
      system(%(cd #{project} && #{$PROGRAM_NAME} #{task_name} --trace)) || errors << project
    end
    raise("Errors in #{errors.join(', ')}") unless errors.empty?
  end
end
