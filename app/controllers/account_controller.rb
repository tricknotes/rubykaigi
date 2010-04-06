class AccountController < ApplicationController
	def signup
		@rubyist = Rubyist.new
	end

	verify :method => :post, :session => :twitter_user_id, :only => :register

	def register
		@rubyist = Rubyist.new(params[:rubyist].merge(:twitter_user_id => session[:twitter_user_id]))

		if @rubyist.save
			self.user = @rubyist
			session.delete(:twitter_user_id)
			redirect_to root_path
		else
			render :signup
		end
	end

	def signout
		logout
		redirect_to root_path
	end
end
