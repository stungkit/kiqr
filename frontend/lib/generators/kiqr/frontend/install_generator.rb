# frozen_string_literal: true

module Kiqr
  module Frontend
    module Generators
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path(Kiqr::Frontend::Engine.root, __FILE__)

        def check_webpacker_installed
          return if Object.const_defined?('Webpacker')

          say 'Please install webpacker first.', :red
          exit
        end

        def install_tailwindcss
          say 'Installing TailwindCSS'
          rails_command('tailwindcss:install')
        end

        def install_importmap
          say 'Installing importmap'
          rails_command('importmap:install')
        end

        def install_hotwire
          say 'Installing stimulus-rails (Hotwire)'
          rails_command('stimulus:install')
        end

        def replace_stylesheets
          say 'Adding stylesheets'
          stylesheets_path = Webpacker.config.source_path.join('stylesheets')
          run "rm -rf #{stylesheets_path}/application.scss"
          run "rm -rf #{stylesheets_path}/tailwind.config.js"
          directory 'lib/generators/templates/stylesheets', stylesheets_path
        end

        def add_stimulus_controllers
          say 'Adding Stimulus controllers'
          directory 'app/javascript/controllers', 'app/javascript/controllers'
        end

        def install_view_files
          say 'Adding app views'
          directory 'app/views', 'app/views'
        end

        def install_helpers
          say 'Adding helpers'
          directory 'app/helpers', 'app/helpers'
        end

        def install_initializers
          say 'Adding initializers'
          directory 'config/initializers', 'config/initializers'
        end

        def install_locales
          say 'Adding locales'
          directory 'config/locales', 'config/locales'
        end
      end
    end
  end
end
