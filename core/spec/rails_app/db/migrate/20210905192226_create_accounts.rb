class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.belongs_to :owner, foreign_key: { to_table: :users }
      t.string :name
      t.string :billing_email
      t.boolean :personal, default: false
      t.boolean :pending_setup, default: true
      t.timestamps
    end
  end
end
