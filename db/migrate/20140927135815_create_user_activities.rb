class CreateUserActivities < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.references :user, index: true
      t.string :activity
      t.string :comment

      t.timestamps
    end
  end
end
