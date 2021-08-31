# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rubocop/rake_task'

KIQR_GEMS = %w[core].freeze

task default: :spec

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

desc 'Clean the whole repository by removing all the generated files'
task :clean do
  rm_f 'Gemfile.lock'

  KIQR_GEMS.each do |gem_name|
    rm_f  "#{gem_name}/Gemfile.lock"
    # rm_rf "#{gem_name}/spec/dummy"
  end
end
