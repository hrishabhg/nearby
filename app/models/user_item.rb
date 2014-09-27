class UserItem < ActiveRecord::Base

  belongs_to :user

  enum :price_type => %w(fixed per_day per_month per_year)

end
