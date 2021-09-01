root    = File.expand_path('..', __dir__)
version = File.read("#{root}/KIQR_VERSION").strip


namespace :gem do
  pkg_dir = "#{root}/pkg"

  task build: :update_versions do
    FileUtils.mkdir_p pkg_dir

    sh 'rake build'
    KIQR_GEMS.each do |gem_name|
      gemspec = "kiqr_#{gem_name}.gemspec"
      gemfile = "kiqr_#{gem_name}-#{version}.gem"

      Dir.chdir(gem_name) do
        sh "gem build #{gemspec}"
        mv gemfile, "#{pkg_dir}/#{gemfile}"
      end
    end
  end

  desc "Release all gems to rubygems"
  task release: :build do
    # sh "git tag -a -m \"Version #{version}\" v#{version}"

    sh "gem push '#{pkg_dir}/kiqr-#{version}.gem'"
    KIQR_GEMS.each do |gem_name|
      gemfile = "kiqr_#{gem_name}-#{version}.gem"
      gem_path = "#{pkg_dir}/#{gemfile}"
      sh "gem push '#{gem_path}'"
    end
  end
end
