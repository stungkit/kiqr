# frozen_string_literal: true

root    = File.expand_path('..', __dir__)
version = File.read("#{root}/KIQR_VERSION").strip

namespace :gem do
  pkg_dir = "#{root}/pkg"

  task build: :update_versions do
    FileUtils.mkdir_p pkg_dir

    KIQR_GEMS.each do |gem_name|
      if gem_name == 'cmd'
        gemspec = 'kiqr.gemspec'
        gemfile = "kiqr-#{version}.gem"
      else
        gemspec = "kiqr_#{gem_name}.gemspec"
        gemfile = "kiqr_#{gem_name}-#{version}.gem"
      end

      Dir.chdir(gem_name) do
        sh "gem build #{gemspec}"
        mv gemfile, "#{pkg_dir}/#{gemfile}"
      end
    end
  end

  desc 'Release all gems to rubygems'
  task :release do
    # sh "git tag -a -m \"Version #{version}\" v#{version}"

    KIQR_GEMS.each do |gem_name|
      gemfile = if gem_name == 'cmd'
                  "kiqr-#{version}.gem"
                else
                  "kiqr_#{gem_name}-#{version}.gem"
                end

      gem_path = "#{pkg_dir}/#{gemfile}"
      puts "gem push '#{gem_path}'"
    end
  end
end
