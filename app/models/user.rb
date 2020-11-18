class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :orders
  has_many :products, through: :orders
  has_many :appoinments
  has_many :billings
  has_many :services

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token
      user.name = auth.info.name
    end
  end
end
