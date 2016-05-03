class UserMailer < ApplicationMailer
	default from: "admin@fitchike.com"

  def signup_confirmation(profile)
    @profile = profile

    mail to: profile.user.email, subject: "Sign Up Confirmation"
  end

  def appointment_confirmation(profile)
  	@profile = profile
  	mail to: profile.user.email, subject: "New Appointment Created"
  end

end

