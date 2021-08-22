class CreateAccounts < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :accounts do |t|
      t.string :name
      t.belongs_to :owner, foreign_key: { to_table: :<%= table_name %> }
      t.timestamps
    end
  end
end
