# frozen_string_literal: true

module Kiqr
  module Models
    module User
      extend ActiveSupport::Concern

      included do
        has_many :members
        has_many :accounts, through: :members
      end

      def to_s
        email
      end
    end
  end
end
