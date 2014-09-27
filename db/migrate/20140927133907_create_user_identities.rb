class CreateUserIdentities < ActiveRecord::Migration
  def change
    create_table :user_identities do |t|
      t.references :user, index: true
      t.integer :adapter
      t.integer :adapter_identifier
      t.string :hash
      t.boolean :is_active, :default => 0

      t.timestamps
    end
  end
end
