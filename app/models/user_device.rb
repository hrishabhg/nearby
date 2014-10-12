class UserDevice < ActiveRecord::Base

  enum :device_type => %w(iphone android windows other)
  belongs_to :user

end
