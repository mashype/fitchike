class UserMailer < ApplicationMailer
	default from: "admin@fitchike.com"

  def signup_confirmation(profile)
    @profile = profile

    mail to: profile.user.email, subject: "Sign Up Confirmation"
  end
end
