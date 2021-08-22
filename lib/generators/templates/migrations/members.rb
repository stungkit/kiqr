class CreateMembers < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :members do |t|
      t.belongs_to :user, foreign_key: { to_table: :<%= table_name %> }
      t.belongs_to :account, foreign_key: { to_table: :accounts }
      t.timestamps
    end
  end
end
