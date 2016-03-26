class Profile < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	belongs_to :gender
	belongs_to :user

	has_many :reviews
	has_many :appointments
	
	has_many :profile_certifications
	has_many :certifications, through: :profile_certifications
	accepts_nested_attributes_for :profile_certifications, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :certifications, reject_if: :all_blank, allow_destroy: true

	has_many :profile_workouts
	has_many :workouts, through: :profile_workouts
	accepts_nested_attributes_for :profile_workouts, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :workouts, reject_if: :all_blank, allow_destroy: true

	has_many :profile_locations
	has_many :locations, through: :profile_locations
	accepts_nested_attributes_for :profile_locations, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true

end

