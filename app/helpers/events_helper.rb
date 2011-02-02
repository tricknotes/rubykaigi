module EventsHelper
  def presentation_movies(event)
    render 'presentation_videos', :event => event if event.has_movies?
  end
  
  def render_vimeo(vimeo_id)
    render 'embeded_vimeo', :vimeo_id => vimeo_id unless vimeo_id.blank?
  end
  
  def nicovideo_link(item_id)
    render 'nicovideo_link', :item_id => item_id unless item_id.blank?
  end
end
