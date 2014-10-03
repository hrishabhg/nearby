class CreateUserDevices < ActiveRecord::Migration
  def change
    create_table :user_devices do |t|
      t.references :user, :index => true
      t.integer :device_type, :limit => 1
      t.string :device_token
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
