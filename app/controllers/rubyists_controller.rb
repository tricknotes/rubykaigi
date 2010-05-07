class RubyistsController < ApplicationController
  def show
    @rubyist = Rubyist.find_by_username(params[:id])
  end

  verify :session => :credentials, :only => %w(new create), :redirect_to => :new_sessions_path

  def new
    @rubyist = Rubyist.new
  end

  def create
    @rubyist = Rubyist.new(params[:rubyist]) do |r|
      r.twitter_user_id, r.identity_url = session[:credentials].values_at(:twitter_user_id, :identity_url)
    end


    if @rubyist.save
      self.user = @rubyist
      session.delete(:credentials)

      redirect_to session.delete(:return_to) || root_path
    else
      render :new
    end
  end
end
