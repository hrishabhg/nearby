class UserDetail < ActiveRecord::Base

  enum :privacy_level => %w(public private semi_private)
  belongs_to :user

end
