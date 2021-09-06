class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.belongs_to :user, foreign_key: { to_table: :users }
      t.belongs_to :account, foreign_key: { to_table: :accounts }
      t.string :role, nullable: false
      t.timestamps
    end
  end
end
