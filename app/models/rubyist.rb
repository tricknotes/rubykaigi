class Rubyist < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_format_of :name, :with => /[\w-]+/
  validates_exclusion_of :name, :in => %w(new)

  validates_uniqueness_of :twitter_user_id
  validates_uniqueness_of :identity_url

  def to_param
    name
  end
end
