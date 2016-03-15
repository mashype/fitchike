class Profile < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	belongs_to :gender
	belongs_to :user

	has_many :reviews
end