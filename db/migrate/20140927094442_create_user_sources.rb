class CreateUserSources < ActiveRecord::Migration
  def change
    create_table :user_sources do |t|
      t.string :name, :null => false
      t.string :identifier
      t.integer :users_count, :default => 0, :null => false

      t.timestamps
    end
  end
end
