class WelcomeController < ApplicationController
	def index
		authenticate
	end
end
