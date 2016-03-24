class ProfileCertification < ActiveRecord::Base

	belongs_to :profile
	belongs_to :certification

	accepts_nested_attributes_for :certification

end
