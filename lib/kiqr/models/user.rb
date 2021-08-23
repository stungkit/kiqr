module Kiqr
  module Models
    module User
      extend ActiveSupport::Concern

      included do
        has_many :members
        has_many :accounts, through: :members
        belongs_to :account, optional: true
      end

      # Create a default account for our new user.
      def create_default_account
        return accounts.first if accounts.any?

        account = accounts.create(owner: self, name: email)
        update(account: account)
        account
      end
    end
  end
end
