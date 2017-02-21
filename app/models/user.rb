class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, :dependent => :destroy

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(first_name: auth_hash['extra']['raw_info']['name'], email: auth_hash["extra"]["raw_info"]["email"],password:'test')
      user.authentications << (authentication)
      return user
  end

  def skipping
    self.skip_password_validation=true
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

end
