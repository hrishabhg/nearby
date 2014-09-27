class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.references :user, index: true
      t.string :detail_name
      t.string :detail_value
      t.integer :privacy_level, :limit => 1
      t.boolean :is_active, :default => 1

      t.timestamps
    end
  end
end
