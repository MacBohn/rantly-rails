class User < ActiveRecord::Base

  include Gravtastic
    gravtastic

  has_secure_password

  validates :email, presence: :true
  validates :password, presence: :true


  def full_name
    "#{first_name}  #{last_name}"
  end

  has_many :rants

end
