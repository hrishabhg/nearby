class RemoveUserIdFromLocations < ActiveRecord::Migration
  def change
    remove_reference :locations, :user, index: true
  end
end
