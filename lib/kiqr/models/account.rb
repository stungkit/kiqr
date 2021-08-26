module Kiqr
  module Models
    module Account
      extend ActiveSupport::Concern

      included do
        has_many :members
        has_many :users, through: :members
        belongs_to :owner, class_name: 'User'

        validates :name, presence: true
        validates :billing_email, presence: true, 'valid_email_2/email': Kiqr.config.email_validations

        after_validation :set_pending_setup_to_false
      end

      # Set pending setup to false the first time an account is validated.
      def set_pending_setup_to_false
        self.pending_setup = false if errors.empty?
      end
    end
  end
end
