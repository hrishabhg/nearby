class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.datetime :register_date
      t.boolean :is_verified, :default => false
      t.boolean :is_active, :default => false
      t.boolean :is_individual, :default => true
      t.boolean :is_seller, :default => false
      t.boolean :is_seller_verified, :default => false
      t.integer :preferred_contact_id

      t.timestamps
    end
    add_index :users, :username, :unique => true
  end
end
