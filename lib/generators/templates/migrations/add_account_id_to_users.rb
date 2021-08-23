# frozen_string_literal: true

class AddAccountIdTo<%= table_name.camelize %> < ActiveRecord::Migration<%= migration_version %>
  def change
    unless ActiveRecord::Base.connection.column_exists?(:<%= table_name %>, :account_id)
      add_belongs_to :<%= table_name %>, :account, foreign_key: true
    end
  end
end
