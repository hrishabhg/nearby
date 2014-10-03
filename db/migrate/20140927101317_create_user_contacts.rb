class CreateUserContacts < ActiveRecord::Migration
  def change
    create_table :user_contacts do |t|
      t.references :user, index: true
      t.integer :contact_type, :default => 0
      t.string :contact
      t.boolean :is_verified, :default => false
      t.boolean :is_active, :default => true
      t.integer :verify_attempt_count, :default => 0
      t.integer :created_by

      t.timestamps
    end
  end
end
