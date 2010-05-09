class RubyistsController < ApplicationController
  def show
    @rubyist = Rubyist.find_by_username(params[:id])
  end
end
