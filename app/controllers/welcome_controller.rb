class WelcomeController < ApplicationController
	def index
		authenticate

		if authenticated? && user.new_record?
			session[:twitter_user_id] = user.twitter_user_id
			redirect_to :controller => 'account', :action => 'signup'
		end
	end
end
