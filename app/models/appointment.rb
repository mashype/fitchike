class Appointment < ActiveRecord::Base
	belongs_to :user
	belongs_to :profile

	has_many :confirmations
end

