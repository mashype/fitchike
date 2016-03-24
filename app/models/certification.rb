class Certification < ActiveRecord::Base

	has_many :profile_certifications
	has_many :profiles, through: :profile_certifications

end
