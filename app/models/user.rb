class User < ActiveRecord::Base

  include Gravtastic
    gravtastic
    
  has_secure_password

  def full_name
    "#{first_name}  #{last_name}"
  end

  has_many :rants

end
