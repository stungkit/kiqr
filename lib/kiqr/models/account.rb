module Kiqr
  module Models
    module Account
      extend ActiveSupport::Concern

      included do
        has_many :members
        has_many :users, through: :members
        belongs_to :owner, class_name: 'User'

        validates :name, presence: true
      end

      # Titleize name
      def name=(name)
        # .to_s protects against nils
        write_attribute(:name, name.to_s.titleize.strip)
      end
    end
  end
end
