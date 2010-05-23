class Event < ActiveRecord::Base
  has_many :event_rubyists
  has_many :speakers, :source => :account, :through => :event_rubyists, :source => :rubyist
  has_many :event_time_slits
  has_many :time_slits, :through => :event_time_slits, :order => 'start_at'
  has_one :event_room
  has_one :room, :through => :event_room

  def title
    I18n.locale.to_s == 'ja' ? (title_ja || title_en) : (title_en || title_ja)
  end

  def abstract
    I18n.locale.to_s == 'ja' ? (abstract_ja || abstract_en) : (abstract_en || abstract_ja)
  end

  def detail
    I18n.locale.to_s == 'ja' ? (detail_ja || detail_en) : (detail_en || detail_ja)
  end

  def from
    time_slits.first.start_at
  end

  def to
    time_slits.last.end_at
  end

  def date
    from.to_date
  end
end
