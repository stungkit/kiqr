# frozen_string_literal: true

gem 'kiqr', path: '..'
gem 'kiqr_devise', path: '..'

rails_command 'generate kiqr:install user'
