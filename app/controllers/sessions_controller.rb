class SessionsController < ApplicationController
  layout_for_latest_ruby_kaigi

  def new
  end

  # redirect to authenticator, and callback here
  def show
    authenticate!
    flash[:notice] = 'You have signed in successfully'
    redirect_to session.delete(:return_to) || dashboard_path
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
      redirect_to new_account_path
    elsif openid = opts[:openid]
      session[:credentials] = {:identity_url => openid[:response].identity_url}
      redirect_to new_account_path
    else
      flash[:error] = warden.message
      redirect_to new_sessions_path
    end
  end
end
