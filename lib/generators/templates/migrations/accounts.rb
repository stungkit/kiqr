class CreateAccounts < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :accounts do |t|
      t.belongs_to :owner, foreign_key: { to_table: :<%= table_name %> }
      t.string :name
      t.string :billing_email
      t.boolean :personal, default: false
      t.boolean :pending_setup, default: true
      t.timestamps
    end
  end
end
