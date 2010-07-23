class SessionsController < ApplicationController
  layout_for_latest_ruby_kaigi

  def new
  end

  # redirect to authenticator, and callback here
  def show
    authenticate!
    flash[:notice] = 'You have signed in successfully'
    redirect_to session.delete(:return_to) || dashboard_path
  rescue Net::HTTPFatalError => e
    Rails.logger.warn e
    flash[:error] = 'Something Wrong in Twitter.'
    redirect_to new_sessions_path
  end


  def destroy
    logout
    flash[:notice] = 'You have signed out successfully'
    redirect_to :back
  end

  def unauthenticated
    opts = warden.env['warden.options']

    if oauth = opts[:oauth]
      handle_twitter(oauth)
    elsif openid = opts[:openid]
      handle_openid(openid)
    else
      flash[:error] = warden.message
      redirect_to new_sessions_path
    end
  end

  private

  def handle_twitter(oauth)
    twitter = oauth[:twitter]
    atoken = twitter[:access_token]

    client = Twitter::OAuth.new(*twitter.values_at(:consumer_key, :consumer_secret))
    client.authorize_from_access atoken.token, atoken.secret

    user_id = atoken.params[:user_id]

    begin
      profile = Twitter::Base.new(client).user(user_id)

      begin
        TwitterProfile[user_id] = profile.slice(:screen_name, :profile_image_url)
      rescue Errno::ECONNREFUSED => e
        Rails.logger.warn e
      end
    rescue Twitter::Unavailable, Twitter::InformTwitter, Twitter::RateLimitExceeded => e
      Rails.logger.warn e
      profile = Hashie::Mash.new
    end

    redirect_to_new_account_path(
      :twitter_user_id => user_id,
      :full_name       => profile.name,
      :website         => profile.url,
      :avatar_type     => 'twitter'
    )
  end

  def handle_openid(openid)
    redirect_to_new_account_path(
      :identity_url => openid[:response].identity_url
    )
  end

  def redirect_to_new_account_path(paramz)
    session[:params_from_authenticator] = paramz
    redirect_to new_account_path
  end
end
