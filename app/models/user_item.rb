class UserItem < ActiveRecord::Base

  enum :price_type => %w(fixed per_day per_month per_year)
  belongs_to :user
  has_one :user_item_location

end
