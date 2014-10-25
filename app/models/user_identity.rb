require 'digest/sha1'
class UserIdentity < ActiveRecord::Base

  enum :adapter => %w(password auth_token facebook google twitter)
  belongs_to :user

  before_create do
    if adapter === UserIdentity.adapters[:password]
      self.hash_string = Digest::SHA1.haxdigest(self.hash_string)
    elsif adapter === UserIdentity.adapters[:auth_token]
      self.hash_string = self.generate_token
    end
  end

  private
  def generate_token
    _token = Devise.friendly_token
    generate_token if UserIdentity.where(:hash => _token, :adapter => :auth_token).exists?
    _token
  end
end
