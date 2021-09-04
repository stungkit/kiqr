# frozen_string_literal: true

require 'rubocop/rake_task'

$LOAD_PATH.unshift File.dirname(__FILE__)

KIQR_GEMS = %w[core].freeze

Dir[File.join(__dir__, 'tasks', '*.rb')].sort.each { |file| require file }

task default: %i[rubocop spec]

%w[spec clean].each do |task_name|
  desc "Run #{task_name} task for all projects"
  task task_name do
    errors = []
    KIQR_GEMS.each do |project|
      puts "Running #{task_name} in #{project}/"
      system(%(cd #{project} && #{$PROGRAM_NAME} #{task_name} --trace)) || errors << project
    end
    raise("Errors in #{errors.join(', ')}") unless errors.empty?
  end
end
