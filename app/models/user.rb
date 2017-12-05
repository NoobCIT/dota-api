class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :account_id, presence: true
  validates :username, presence: true, length: { minimum: 6, maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_senstitive: false }
  has_secure_password #accounts for not having password in database
  validates :password, presence: true,
                       length: { minimum: 6 },
                       allow_nil: true #got rid of duplicate error messages


  #Returns hash digest of a given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #Return a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #remembers a user in the database
  def remember
    self.remember_token = User.new_token #set user's remember token = random token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #forget a user
  def forget
    update_attribute(:remember_digest, nil)
  end
end
