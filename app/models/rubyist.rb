class Rubyist < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_format_of :username, :with => /[\w-]+/
  validates_exclusion_of :username, :in => %w(new edit)

  validates_uniqueness_of :twitter_user_id, :allow_nil => true
  validates_uniqueness_of :identity_url, :allow_nil => true

  attr_protected :twitter_user_id, :identity_url

  def to_param
    username
  end
end
