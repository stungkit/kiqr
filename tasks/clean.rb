# frozen_string_literal: true

desc 'Clean the whole repository by removing all the generated files'
task :clean do
  rm_f 'Gemfile.lock'
  rm_rf 'pkg'
  rm_rf 'sandbox'
  rm_rf '.bundle'
  rm_rf '**/*.gem'
end
