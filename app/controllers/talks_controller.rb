class TalksController < LocaleBaseController
  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }
  before_filter :capture_year

  def index
    redirect_to "/2009/#{params[:locale]}/talks"
  end

  def show
    @year, code = [params[:year], params[:id]]
    redirect_to "/#{@year}/#{params[:locale]}/talks/#{code.upcase}"
  end

  private
  def capture_year
    @year = params[:year]
  end
end
