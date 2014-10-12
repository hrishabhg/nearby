class User < ActiveRecord::Base

  belongs_to :user_source
  has_one :email, -> { where(:contact_type => :email) }, :class_name => :user_contact
  has_one :default_address, ->{ where(:is_default => 1) }, :class_name => :user_address
  has_one :user_location, ->{ where(:is_active => 1) }
  has_one :location, through: :user_location
  has_many :user_activities
  has_many :user_addresses
  has_many :user_contacts
  has_many :user_details
  has_many :user_devices
  has_many :user_identities
  has_many :user_items
  has_many :user_locations
  has_many :locations, :through => :user_locations
  alias_attribute :seller?, :is_seller
  alias_attribute :active?, :is_active

end
