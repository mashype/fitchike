class Appointment < ActiveRecord::Base
	belongs_to :user
	belongs_to :profile
	belongs_to :length

	has_many :confirmations
end

