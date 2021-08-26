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
      end
    end
  end
end
