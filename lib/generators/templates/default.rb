# frozen_string_literal: true

KIQR_VERSION = '1.0.0.alpha'

# GEMFILE
########################################
inject_into_file 'Gemfile', before: 'group :development, :test do' do
  <<~RUBY
  # -------- Kiqr dependencies ---------

  # Required:
  gem 'devise', '~> 4.8.0'
  gem 'kiqr_core', '~> #{KIQR_VERSION}'

  # Addons (optional):
  gem 'turbo-rails', '0.7.11'
  gem 'stimulus-rails', '0.3.11'
  gem 'responders', git: 'https://github.com/heartcombo/responders' # until Responders gem is published with version >= 3.0.2.

  gem 'tailwindcss-rails'
  gem 'heroicon'
  # ----- End of Kiqr dependencies -----

  RUBY
end

# Uncomment to uncomment Redis in Gemfile
# gsub_file('Gemfile', /# gem 'redis'/, "gem 'redis'")

# Environment configs
########################################
env_config = <<~RUBY
  config.action_mailer.default_url_options = {host: "http://localhost:3000"}
RUBY

environment env_config, env: 'development'

after_bundle do
  generate(:controller, 'pages', 'home', '--skip-routes', '--no-test-framework')

  # Routes
  ########################################
  route "root to: 'pages#home'"

  # Git ignore
  ########################################
  append_file '.gitignore', <<~TXT
    # Ignore .env file containing credentials.
    .env*
    # Ignore Mac and Linux file system files
    *.swp
    .DS_Store
  TXT

  # Install hotwire
  rails_command('turbo:install')
  rails_command('stimulus:install')

  # TailwindCSS install
  rails_command('tailwindcss:install')

  # Devise install + user
  ########################################
  generate('devise:install')
  generate('devise', 'User')

  # Kiqr install
  generate('kiqr:install', 'user')
end

run 'touch .env'

git add: '.'
git commit: "-m 'Kiqr #{KIQR_VERSION}'"