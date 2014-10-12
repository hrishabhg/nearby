class UserContact < ActiveRecord::Base

  enum :contact_type => %w(phone email)
  belongs_to :user
  has_one :creater, :class_name => :user, :foreign_key => :created_by

end
