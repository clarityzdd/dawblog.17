require 'digest'
class User < ApplicationRecord
  attr_accessor :password
  before_save :encrypt_new_password
  has_one :profile
  has_many :articles, ->{order('published_at DESC, title ASC')}, dependent: :nullify
  has_many :replies, through: :articles, source: :comments
  validates :email, uniqueness: {case_sensitive: false, message: 'El correo debe ser único'}, length: {in: 6..20, too_short: "debe tener al menos %{count} caracteres"}, format: {multiline: true,with: /^.+@.+$/, message: "formato de correo no valido"}
  validates :password, confirmation: true, length: {within: 4..20}, presence: {if: :password_required?}
  validates :password_confirmation, presence: true
  
  def self.authenticate(email,password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end
  
  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end
  
  protected
  def encrypt_new_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end
  def password_required?
    hashed_password.blank? || password.present?
  end
  def encrypt(string)
    Digest::SHA1.hexdigest(string) 
  end
  
end
