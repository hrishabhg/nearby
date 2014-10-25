class CreateUserIdentities < ActiveRecord::Migration
  def change
    create_table :user_identities do |t|
      t.references :user, index: true
      t.integer :adapter
      t.integer :adapter_identifier
      t.string :hash_string
      t.boolean :is_active, :default => false

      t.timestamps
    end
  end
end
