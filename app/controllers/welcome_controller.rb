class WelcomeController < ApplicationController
  before_filter do |c|
    I18n.locale = c.params[:locale]
  end

  def index
    @headlines = HeadlineEntry.recent(I18n.locale, 5)
  end
end
