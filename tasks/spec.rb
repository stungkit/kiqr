# frozen_string_literal: true

desc 'Run rubocop tests.'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end
