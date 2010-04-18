class RubyistsController < ApplicationController
  def show
    @rubyist = Rubyist.find_by_name(params[:id])
  end

  verify :session => :credentials, :only => %w(new create), :redirect_to => :new_sessions_path

  def new
    @rubyist = Rubyist.new
  end

  def create
    @rubyist = Rubyist.new(params[:rubyist].merge(session[:credentials]))

    if @rubyist.save
      self.user = @rubyist
      session.delete(:credentials)

      redirect_to root_path
    else
      render :new
    end
  end
end
