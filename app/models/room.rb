# -*- coding: utf-8 -*-
class Room < ActiveRecord::Base
  has_many :event_rooms
  has_many :events, :through => :event_rooms

  def name
    I18n.locale.to_s == 'ja' ? (name_ja || name_en) : (name_en || name_ja)
  end

  def hall?
    case I18n.locale.to_s
    when 'ja'
      name.match(/ホール/u)
    else
      name.match(/hall/i)
    end
  end

  def empty_at?(time)
    events.none? {|e| (e.from...e.to).include? time}
  end
end
