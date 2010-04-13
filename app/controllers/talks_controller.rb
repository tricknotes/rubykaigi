class TalksController < LocaleBaseController
  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }
  before_filter :capture_year

  def index
    redirect_to "/2009/#{params[:locale]}/talks"
  end

  def show
    @year, code = [params[:year], params[:id].upcase]
    @talk = Talk.year(@year).find_by_code(code)
    require 'json'
    @nicovideo_links = JSON.parse(@talk.nicovideo_links) # sm, title
    unless @talk
      render :file => "#{Rails.root}/public/404.html", :status => 404
      return
    end
    respond_to do |wants|
      wants.html do
        @title = @talk.title
        render :template => "#{controller_name}/#{@year}/#{action_name}"
      end
      wants.json do
        render :json => @talk.to_json
      end
    end
  end

  private
  def capture_year
    @year = params[:year]
  end
end
