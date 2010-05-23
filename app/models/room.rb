class Room < ActiveRecord::Base
  def name
    I18n.locale.to_s == 'ja' ? (name_ja || name_en) : (name_en || name_ja)
  end
end
