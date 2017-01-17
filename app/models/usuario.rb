require 'bcrypt'

class Usuario < ApplicationRecord
  has_many :habilidades
  has_many :ferramentas
  #attr_accessor :password
  has_secure_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  USERNAME_REGEX = /\A[a-zA-Z0-9|\._]+\Z/
  FULLNAME_REGEX = /.+[a-zA-Z]{3}+/

  validates :login, :presence => true, :uniqueness => true, :format => {with: USERNAME_REGEX, message: "Invalid, (only A-Z, a-z, 0-9, '.' and '_' are acceptable)"}, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true, :length => { :in => 3..20 }
  validates :nome_completo, :presence => true, length: {:in => 3..60}, :format => FULLNAME_REGEX

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  #Set password seset attributes
  def create_reset_digest
    self.reset_token = Usuario.new_token
    update_attribute(:reset_digest,  Usuario.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def delete_reset_digest
    self.reset_token = nil
    update_attribute(:reset_digest, nil)
    update_attribute(:reset_sent_at, nil)
  end

  # Sends password reset email.
    def send_password_reset_email
      UserMailer.password_reset(self).deliver_now
    end

    # Returns true if a password reset has expired.
    def password_reset_expired?
      reset_sent_at.nil? || reset_sent_at < 30.minutes.ago
    end

    #Validate if the reset token digest exists and match the given token
    def valid_reset_token?(token)
      !self.reset_digest.nil? && !password_reset_expired? && self.authenticated?(:reset, token)
    end

    #Update password if token is valid and invalidate token after
    def update_password_with_token(password:,password_confirmation:,token:)
      status_update = false
      if self.valid_reset_token?(token)
        status_update = self.update_attributes(password: password,password_confirmation: password_confirmation)
          self.delete_reset_digest if status_update
      end
      status_update
    end

    def self.authenticate(login_or_email, password)
      if EMAIL_REGEX.match(login_or_email)
        user = Usuario.find_by_email(login_or_email)
      else
        user = Usuario.find_by_login(login_or_email)
      end
      if user && user.authenticate(password)
        return user
      else
        return false
      end
    end

    def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.match_reset_token(email:, token:)
    user = Usuario.find_by_email(email)
    if user&.valid_reset_token?(token)
      user
    end
  end

  def self.reset_token_exists?(token)
    Usuario.pluck(:reset_digest).any?{ |digest| !digest.nil? && BCrypt::Password.new(digest).is_password?(token)}
  end

  def self.reset_token_is_valid?(token)
    Usuario.any?{ |user| user.valid_reset_token?(token) && BCrypt::Password.new(user.reset_digest).is_password?(token)}
  end

  private

  def downcase_attributes
    self.email.downcase!
    self.login.downcase!
  end

  def remove_spaces
    self.full_name.strip!
  end
end
