# frozen_string_literal: true

desc 'Clean the whole repository by removing all the generated files'
task :clean do
  rm_f 'Gemfile.lock'
  rm_rf 'pkg'
  rm_rf '.bundle'
  rm_rf 'sandbox'

  KIQR_GEMS.each do |gem_name|
    rm_f "#{gem_name}/Gemfile.lock"
    rm_rf "#{gem_name}/.bundle"
    # rm_rf "#{gem_name}/spec/dummy"
  end
end
