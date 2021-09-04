# frozen_string_literal: true

root    = File.expand_path('..', __dir__)
version = File.read("#{root}/KIQR_VERSION").strip

desc 'Update version.rb files with KIQR_VERSION in all projects'
task :update_versions do
  file = 'lib/generators/templates/default.rb'
  ruby = File.read(file)
  ruby.gsub!(/^(\s*)KIQR_VERSION(\s*)= .*?$/, "\\1KIQR_VERSION = '#{version}'")
  raise "Could not insert version in #{file}" unless Regexp.last_match(1)

  File.open(file, 'w') { |f| f.write ruby }

  KIQR_GEMS.each do |gem_name|
    glob = root.dup
    glob << "/#{gem_name}/lib/**"
    glob << '/gem_version.rb'

    file = Dir[glob].first
    ruby = File.read(file)

    puts "Bump version in #{file} to #{version}"

    major, minor, tiny, pre = version.split('.', 4)
    pre = pre ? pre.inspect : 'nil'

    ruby.gsub!(/^(\s*)MAJOR(\s*)= .*?$/, "\\1MAJOR = #{major}")
    raise "Could not insert MAJOR in #{file}" unless Regexp.last_match(1)

    ruby.gsub!(/^(\s*)MINOR(\s*)= .*?$/, "\\1MINOR = #{minor}")
    raise "Could not insert MINOR in #{file}" unless Regexp.last_match(1)

    ruby.gsub!(/^(\s*)TINY(\s*)= .*?$/, "\\1TINY  = #{tiny}")
    raise "Could not insert TINY in #{file}" unless Regexp.last_match(1)

    ruby.gsub!(/^(\s*)PRE(\s*)= .*?$/, "\\1PRE   = #{pre}")
    raise "Could not insert PRE in #{file}" unless Regexp.last_match(1)

    File.open(file, 'w') { |f| f.write ruby }
  end
end
