# frozen_string_literal: true

module Kiqr
  module Models
    module Member
      extend ActiveSupport::Concern

      included do
        belongs_to :user
        belongs_to :account

        before_validation :set_owner_default_role, on: :create
        validates :role, presence: true
      end

      def role_name
        role.capitalize
      end

      def role?(str)
        role.include? str
      end

      def set_owner_default_role
        self.role = ::Member::FIRST_USER_ROLE
      end
    end
  end
end
