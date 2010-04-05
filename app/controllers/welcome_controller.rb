class WelcomeController < ApplicationController
  def index
    authenticate
#     redirect_to "/2010"
  end
end
