# frozen_string_literal: true

class AddAccountIdToUsers < ActiveRecord::Migration[6.1]
  def change
    unless ActiveRecord::Base.connection.column_exists?(:users, :account_id)
      add_belongs_to :users, :account, foreign_key: true
    end
  end
end
