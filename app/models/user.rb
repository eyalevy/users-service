class User < ApplicationRecord

  validates_presence_of :first_name, :last_name, :password

  validates :email, presence: true, email: true

  def register(params)

    user = User.create({
               user_id: SecureRandom.uuid,
               first_name: params.fetch(:first_name),
               last_name: params.fetch(:last_name),
               email: params.fetch(:email),
               password: Encryption.encrypt(params.fetch(:password))
             })

    user.save
    user
  end


end
