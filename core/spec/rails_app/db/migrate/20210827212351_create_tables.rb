superclass = ActiveRecord::Migration
# TODO: Inherit from the 5.0 Migration class directly when we drop support for Rails 4.
superclass = ActiveRecord::Migration[5.0] if superclass.respond_to?(:[])

class CreateTables < superclass
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false

      t.belongs_to :users, :account, foreign_key: true
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    create_table :accounts do |t|
      t.belongs_to :owner, foreign_key: { to_table: :users }
      t.string :name
      t.string :billing_email
      t.boolean :personal, default: false
      t.boolean :pending_setup, default: true
      t.timestamps
    end

    create_table :members do |t|
      t.belongs_to :user, foreign_key: { to_table: :users }
      t.belongs_to :account, foreign_key: { to_table: :accounts }
      t.string :role, nullable: false
      t.timestamps
    end
  end
end
