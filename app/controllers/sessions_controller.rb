class SessionsController < ApplicationController
  def new
  end

  # redirect to authenticator, and callback here
  def show
    authenticate!
    flash[:notice] = 'You have signed in successfully'
    redirect_to root_path
  end

  def destroy
    logout
    flash[:notice] = 'You have signed out successfully'
    redirect_to :back
  end

  def unauthenticated
    opts = warden.env['warden.options']

    if oauth = opts[:oauth]
      session[:credentials] = {:twitter_user_id => oauth[:twitter][:access_token].params[:user_id]}
      redirect_to new_rubyist_path
    elsif openid = opts[:openid]
      session[:credentials] = {:identity_url => openid[:response].identity_url}
      redirect_to new_rubyist_path
    else
      flash[:error] = warden.message
      redirect_to new_sessions_path
    end
  end
end
