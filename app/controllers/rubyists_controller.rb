class RubyistsController < ApplicationController
  def show
    @rubyist = Rubyist.find_by_name(params[:id])
  end

  verify :session => :twitter_user_id, :only => %w(new create)

  def new
    @rubyist = Rubyist.new(:twitter_user_id => session[:twitter_user_id])
  end

  def create
    @rubyist = Rubyist.new(params[:rubyist].merge(:twitter_user_id => session[:twitter_user_id]))

    if @rubyist.save
      self.user = @rubyist
      session.delete(:twitter_user_id)
      redirect_to root_path
    else
      render :new
    end
  end
end
