class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user, index: true
      t.string :title
      t.string :description
      t.decimal :latitude, precision: 10, scale: 3, :default => 0
      t.decimal :longitude, precision: 10, scale: 3, :default => 0
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
