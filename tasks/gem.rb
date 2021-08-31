root    = File.expand_path('..', __dir__)
version = File.read("#{root}/KIQR_VERSION").strip


namespace :gem do
  pkg_dir = "#{root}/pkg"

  task build: :update_versions do
    FileUtils.mkdir_p pkg_dir

    KIQR_GEMS.each do |gem_name|
      gemspec = "kiqr_#{gem_name}.gemspec"
      gemfile = "kiqr_#{gem_name}-#{version}.gem"

      Dir.chdir(gem_name) do
        sh "gem build #{gemspec}"
        mv "#{gemfile}", "#{pkg_dir}/#{gemfile}"
      end
    end
  end

  desc "Release all gems to rubygems"
  task release: :build do
    # sh "git tag -a -m \"Version #{version}\" v#{version}"

    KIQR_GEMS.each do |gem_name|
      gemfile = "kiqr_#{gem_name}-#{version}.gem"
      gem_path = "#{pkg_dir}/#{gemfile}"
      sh "gem push '#{gem_path}'"
    end
  end
end

# namespace :gem do
#   desc "Build all Kiqr gems"
#   task :build do
#     pkgdir = File.expand_path("../pkg", __FILE__)
#     FileUtils.mkdir_p pkgdir

#     KIQR_GEMS.each do |gem_name|
#       Dir.chdir(gem_name) do
#         sh "gem build spree_#{gem_name}.gemspec"
#         mv "spree_#{gem_name}-#{version}.gem", pkgdir
#       end
#     end

#     sh "gem build spree.gemspec"
#     mv "spree-#{version}.gem", pkgdir
#   end

#   # desc "Install all spree gems"
#   # task install: :build do
#   #   for_each_gem do |gem_path|
#   #     Bundler.with_clean_env do
#   #       sh "gem install #{gem_path}"
#   #     end
#   #   end
#   # end

#   # desc "Release all gems to rubygems"
#   # task release: :build do
#   #   sh "git tag -a -m \"Version #{version}\" v#{version}"

#   #   for_each_gem do |gem_path|
#   #     sh "gem push '#{gem_path}'"
#   #   end
#   # end
# end
