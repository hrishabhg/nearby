class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.datetime :register_date
      t.boolean :is_verified, :default => 0
      t.boolean :is_active, :default => 0
      t.boolean :is_individual, :default => 1
      t.boolean :is_seller, :default => 0
      t.boolean :is_seller_verified, :default => 0
      t.integer :preferred_contact_id

      t.timestamps
    end
    add_index :users, :username, :unique => true
  end
end
