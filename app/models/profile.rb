class Profile < ActiveRecord::Base
	belongs_to :gender
	belongs_to :user
end
