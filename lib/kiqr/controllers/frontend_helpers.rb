module Kiqr
  module Controllers
    module FrontendHelpers
      extend ActiveSupport::Concern

      included do
        helper_method :kiqr_user_modules
      end

      def kiqr_user_modules
        links = []
        Kiqr::USER_MODULES.select { |m| m[:display_at] == :user_dropdown }.each do |mod|
          links << {
            label: mod[:label],
            path: mod[:route]
          }
        end
        links
      end
    end
  end
end
