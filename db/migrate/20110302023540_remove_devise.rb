class RemoveDevise < ActiveRecord::Migration
  def self.up
    drop_table :users
    create_table :users do |t|
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps

    end

    add_index :users, :email,                :unique => true
    add_index :users, :phone_number, :unique => true
  end

  def self.down
    drop_table :users
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable

      t.string :phone_number
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :phone_number, :unique => true
  end
end
