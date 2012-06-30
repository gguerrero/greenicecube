require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation

  has_and_belongs_to_many :groups

  email_regexp    = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  password_regexp = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/

  validates :name,      presence: true,
                        length: { maximum: 50 }
  validates :email,     presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: email_regexp }
  validates :password,  presence: true,
                        confirmation: true,
                        length: { within: 6..25 },
                        format: { with: password_regexp }

  before_save :encrypt_password

  private
  def encrypt_password
    self.salt               = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(str)
    secure_hash("#{salt}$$#{str}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{self.password}")
  end

  def secure_hash(str)
    Digest::SHA2.hexdigest(str)
  end
end
