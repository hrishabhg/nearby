class AddCurrentCookieToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_cookie, :string
  end
end
