# frozen_string_literal: true

# GEMFILE
########################################
inject_into_file 'Gemfile', before: 'group :development, :test do' do
  <<~RUBY
  # -------- Kiqr dependencies ---------

  # Required:
  gem 'authenticatable', path: '../../authenticatable'
  gem 'kiqr_core', path: '..'

  # Addons (optional):
  gem 'kiqr_frontend', path: '..'
  # ----- End of Kiqr dependencies -----

  RUBY
end

# Environment configs
########################################
env_config = <<~RUBY
  config.action_mailer.default_url_options = {host: "http://localhost:3000"}
RUBY

environment env_config, env: 'development'

after_bundle do
  # Git ignore
  ########################################
  append_file '.gitignore', <<~TXT
    # Ignore .env file containing credentials.
    .env*
    # Ignore Mac and Linux file system files
    *.swp
    .DS_Store
  TXT

  generate(:controller, 'pages', 'welcome', '--skip-routes', '--no-test-framework')

  # Routes
  ########################################
  route "root to: 'pages#welcome'"

  # App controller
  ########################################
  run 'rm app/controllers/application_controller.rb'
  file 'app/controllers/application_controller.rb', <<~RUBY
    class ApplicationController < ActionController::Base
    #{  "protect_from_forgery with: :exception\n" if Rails.version < "5.2"}  before_action :authenticate_account!
    end
  RUBY

  # Kiqr install
  generate('kiqr:install')

  # Kiqr_frontend install
  run 'rm -rf app/views'
  generate('kiqr:frontend:install')
  run 'rm -rf app/views' # Delete app/views again so we can develop via kiqr_frontend
end

run 'touch .env'

git add: '.'
git commit: "-m 'Kiqr sandbox'"