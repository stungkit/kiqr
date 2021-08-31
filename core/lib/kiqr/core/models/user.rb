# frozen_string_literal: true

module Kiqr
  module Models
    module User
      extend ActiveSupport::Concern

      included do
        has_many :members
        has_many :accounts, through: :members
        belongs_to :account, optional: true

        after_create :create_personal_account
      end

      # Create a personal account for our new user.
      def create_personal_account
        return accounts.first if accounts.any?

        account = accounts.create(
          owner: self,
          name: email,
          billing_email: email,
          personal: true,
          pending_setup: true
        )

        update(account: account)
        account
      end
    end
  end
end
