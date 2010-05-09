class WelcomeController < LocaleBaseController
  def index
    @headlines = HeadlineEntry.recent(I18n.locale, 5)
  end
end
