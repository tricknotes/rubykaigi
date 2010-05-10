class WelcomeController < LocaleBaseController
  def index
    redirect_to "/#{RubyKaigi.latest_year}"
  end
end
