class Appointment < ActiveRecord::Base
	belongs_to :user
	belongs_to :profile
	belongs_to :length
	belongs_to :location

	has_many :confirmations

	validates_presence_of :title, :comments
end

