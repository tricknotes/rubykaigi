class DashboardController < ApplicationController
  before_filter :login_required

  layout_for_latest_ruby_kaigi

  def index
  end
end
