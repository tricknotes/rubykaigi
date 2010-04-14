class RubyistsController < ApplicationController
  def show
    @rubyist = Rubyist.find_by_name(params[:id])
  end
end
