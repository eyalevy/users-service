class User < ApplicationRecord
  include Encryption

  validates_presence_of :first_name, :last_name, :password
  validates :email, presence: true, email: true

  def create(params)
    user = User.create({
               user_id: SecureRandom.uuid,
               first_name: params.fetch(:first_name),
               last_name: params.fetch(:last_name),
               email: params.fetch(:email),
               password: encrypt(params.fetch(:password))
             })
    user.save
    user
  end

  def update(params)
    self.first_name = params[:first_name] || self.first_name
    self.last_name = params[:last_name] || self.last_name
    self.email = params[:email] || self.email
    self.password = params[:password].nil? ? self.password : encrypt(params[:password])
    self.save
    self
  end

  def sign_in(password)
    if (validate_encryption(self.password, password))
      self.token = encrypt(generate_token)
      self.save
      self
    else
      raise AuthorizationError.new
    end
  end

  def remove_token
    self.token = ''
    self.save
  end

  def generate_token
    SecureRandom.hex(8)
  end
end
