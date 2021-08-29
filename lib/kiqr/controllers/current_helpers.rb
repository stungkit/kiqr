# frozen_string_literal: true

module Kiqr
  module Controllers
    module CurrentHelpers
      extend ActiveSupport::Concern

      included do
        helper_method :current_member,
                      :member_of_account?
      end

      def member_of_account?
        current_member.present?
      end
    end
  end
end
