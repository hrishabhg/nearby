class AddUserSourceRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :user_source, index: true
  end
end
