class Rubyist < ActiveRecord::Base
	validates_uniqueness_of :name
	validates_format_of :name, :with => /[\w-]+/
end
