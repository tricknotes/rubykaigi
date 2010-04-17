class SessionsController < ApplicationController
  def new
  end

  # redirect to authenticator, and callback here
  def show
    authenticate!
    redirect_to root_path
  end

  def destroy
    logout
    redirect_to :back
  end

  def unauthenticated
    if oauth = warden.env['warden.options'][:oauth]
      session[:twitter_user_id] = oauth[:twitter][:access_token].params[:user_id]
      redirect_to new_rubyist_path
    else
      flash[:errors] = warden.errors.full_messages
      redirect_to new_sessions_path
    end
  end
end
