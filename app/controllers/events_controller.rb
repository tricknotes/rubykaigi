class EventsController < LocaleBaseController
  layout_for_latest_ruby_kaigi

  # GET /events
  # GET /events.xml
  def index
    @events = Event.root :include => [:room, :time_slits]
    @rooms = @events.map(&:room).uniq.compact.sort_by(&:sort_order)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.json { render :json => @events.to_json(:only => [:id, :break, :parent_event_id, :presenter_name],
                                                    :methods => [:title, :abstract, :date, :time_slot, :room_name])}
    end
  end

  def timetable
    @events = Event.root :include => [:room, :time_slits]
    @rooms = @events.map(&:room).uniq.sort_by(&:sort_order)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end
end
