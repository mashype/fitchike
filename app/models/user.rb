class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  geocoded_by :current_sign_in_ip
#	after_validation :geocode

  has_many :appointments
  has_many :confirmations
  has_many :reviews, dependent: :destroy
  has_one :profile
end
