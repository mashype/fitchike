class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  def mailboxer_email(object)
    email
  end

	geocoded_by :current_sign_in_ip
	after_validation :geocode

  has_many :appointments
  has_many :confirmations
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :blogcomments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one :profile
end


