class User < ActiveRecord::Base
  has_many :reviews

  enum role: { user: 0, admin: 1 }
  
  has_secure_password
  
  validates :email, presence: true

  validates :password_digest, presence: true

  def full_name
    "#{firstname} #{lastname}"
  end

  # def is_admin
  #   firstname == 'Regan'
  # end
end
