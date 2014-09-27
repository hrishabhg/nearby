class CreateUserItems < ActiveRecord::Migration
  def change
    create_table :user_items do |t|
      t.references :user, index: true
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :price_type, :default => 0
      t.decimal :advance_payment, precision: 10, scale: 2
      t.boolean :is_negotiable, :default => 0
      t.boolean :is_active, :default => 1

      t.timestamps
    end
  end
end
