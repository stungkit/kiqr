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
          rails_command('tailwindcss:install')
        end

        def replace_stylesheets
          stylesheets_path = Webpacker.config.source_path.join('stylesheets')
          run "rm -rf #{stylesheets_path}/application.scss"
          run "rm -rf #{stylesheets_path}/tailwind.config.js"
          directory 'lib/generators/templates/stylesheets', stylesheets_path
        end

        def install_view_files
          directory 'app/views', 'app/views'
        end

        def install_helpers
          directory 'app/helpers', 'app/helpers'
        end

        def install_initializers
          directory 'config/initializers', 'config/initializers'
        end

        def install_locales
          directory 'config/locales', 'config/locales'
        end
      end
    end
  end
end
