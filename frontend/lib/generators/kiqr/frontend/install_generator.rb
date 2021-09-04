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
          stylesheets_path = "#{Webpacker.config.source_path}/stylesheets"
          run 'yarn add tailwindcss@npm:@tailwindcss/postcss7-compat postcss@^7 autoprefixer@^9'
          insert_into_file "#{Webpacker.config.source_entry_path}/application.js", "\nimport \"stylesheets/application\"\n"
          directory 'lib/generators/templates/stylesheets', Webpacker.config.source_path.join('stylesheets')
          insert_into_file "postcss.config.js", "require('tailwindcss')(\"./app/javascript/stylesheets/tailwind.config.js\"),\n    ",
                 before: "require('postcss-import')"
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
