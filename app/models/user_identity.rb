class UserIdentity < ActiveRecord::Base

  enum :adapter_type => %w(password facebook google twitter)
  belongs_to :user

end
