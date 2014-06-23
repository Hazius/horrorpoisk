class WelcomeController < ApplicationController

	def index
		@films = Film.all
		render "films/index"
	end

end
