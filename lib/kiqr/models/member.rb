module Kiqr
  module Models
    module Member
      extend ActiveSupport::Concern

      included do
        belongs_to :user
        belongs_to :account
      end
    end
  end
end
