class CreateUserItemLocations < ActiveRecord::Migration
  def change
    create_table :user_item_locations do |t|
      t.references :user_item, index: true
      t.references :location, index: true

      t.timestamps
    end
  end
end
