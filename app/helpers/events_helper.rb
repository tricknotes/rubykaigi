module EventsHelper
  def presentation_movies(event)
    render 'presentation_videos', :event => event if event.has_movies?
  end
  
  def render_vimeo(vimeo_id)
    render 'embeded_vimeo', :vimeo_id => vimeo_id unless vimeo_id.blank?
  end
  
  def nicovideo_link(item_ids)
    return '' if item_ids.blank?
    res = ''
    _item_ids = item_ids.split(',')
    if _item_ids.size == 1
      res = render(:partial => 'nicovideo_link', :locals => {:item_id => item_ids.first, :link_text => t(:nicovideo)})
    elsif _item_ids.size > 1
      _item_ids.each_with_index do |item_id, index|
        res << render(:partial => 'nicovideo_link', :locals => {:item_id => item_id, :link_text => t(:nicovideo) + " (Part #{index + 1})"})
      end
    end
    res
  end
end
