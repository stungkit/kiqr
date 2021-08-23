module Kiqr
  module Models
    module Account
      extend ActiveSupport::Concern

      included do
        has_many :members
        has_many :users, through: :members
        belongs_to :owner, class_name: 'User'
      end
    end
  end
end
