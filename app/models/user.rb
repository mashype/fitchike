class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :appointments
  has_many :confirmations
  has_many :reviews, dependent: :destroy
  has_one :profile
end
