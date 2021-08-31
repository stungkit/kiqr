# frozen_string_literal: true

desc 'Run bundle install for all projects'
task :bundle do
  KIQR_GEMS.each do |project|
    system(%(cd #{project} && bundle install --jobs 4 --retry 3))
  end
end
