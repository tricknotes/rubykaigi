class Rubyist < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_format_of :name, :with => /[\w-]+/
  validates_exclusion_of :name, :in => %w(new edit)

  validates_uniqueness_of :twitter_user_id, :allow_nil => true
  validates_uniqueness_of :identity_url, :allow_nil => true

  attr_protected :twitter_user_id, :identity_url

  def to_param
    name
  end
end
