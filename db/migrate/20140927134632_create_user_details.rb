class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.references :user, index: true
      t.string :detail_name
      t.string :detail_value
      t.integer :privacy_level, :limit => 1, :default => 0
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
