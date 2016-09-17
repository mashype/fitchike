class WelcomeController < ApplicationController

	def index
		set_meta_tags title: "We Win Together",
							keywords: "fitness workout healthy trainer gym yoga pilates social san diego personal training",
							description: "Fitness made social, get started today"
	end

end