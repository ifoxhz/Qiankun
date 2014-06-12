class User < ActiveRecord::Base
attr_accessor :password, :password_confirmation

  # Validations
  validates_presence_of     :email#, :role
  validates_presence_of     :password,                   :if => :password_required
  validates_presence_of     :password_confirmation,      :if => :password_required
  validates_length_of       :password, :within => 4..40, :if => :password_required
  validates_confirmation_of :password,                   :if => :password_required
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :email,    :case_sensitive => false
  validates_format_of       :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #validates_format_of       :role,     :with => /[A-Za-z]/

  # Callbacks
  before_save :encrypt_password, :if => :password_required

  ##
  # This method is for authentication purpose.
  #
  
  #通过email鉴权并返回用户
  def self.authenticate(email, password)
   # account = first(:conditions => ["lower(email) = lower(?)", email]) if email.present?
    account = self.where(:email=>email).first if email.present?
    account && account.has_password?(password) ? account : nil
  end

#解密用户密码
  def has_password?(password)
    ::BCrypt::Password.new(crypedpwd) == password
  end

  private
#加密用户密码
  def encrypt_password
    value = ::BCrypt::Password.create(password)
    value = value.force_encoding(Encoding::UTF_8) if value.encoding == Encoding::ASCII_8BIT
    self.crypedpwd = value
  end
#判断用户加密的密码区域是否为空
  def password_required
    crypedpwd.blank? || password.present?
  end

end
