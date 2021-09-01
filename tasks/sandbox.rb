# frozen_string_literal: true

root = File.expand_path('..', __dir__)
sandbox_path = "#{root}/sandbox"

rails_flags = [
  '--skip-bundle',
  '--skip-git',
  '--skip-keeps',
  '--skip-rc',
  '--skip-spring',
  '--skip-test',
  '--skip-coffee',
  '--skip-javascript',
  '--skip-bootsnap'
]

namespace :sandbox do
  desc 'Generate a sandbox environment for development.'
  task :install do
    flags = rails_flags.join(' ')
    command = "bundle exec rails new #{sandbox_path} #{flags}"

    rm_rf sandbox_path
    Bundler.with_unbundled_env do
      sh command
    end

    sh "cd #{sandbox_path}"
  end
end

# bundle exec rails new sandbox --database="$RAILSDB"