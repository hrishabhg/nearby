class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.references :user, index: true
      t.string :flat_no
      t.string :street
      t.integer :pincode
      t.references :city, index: true
      t.boolean :is_default, :default => false
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
