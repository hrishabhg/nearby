class UserItemLocation < ActiveRecord::Base
  belongs_to :user_item
  belongs_to :location
end
