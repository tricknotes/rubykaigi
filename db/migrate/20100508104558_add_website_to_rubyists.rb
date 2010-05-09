class AddWebsiteToRubyists < ActiveRecord::Migration
  def self.up
    add_column :rubyists, :website, :string
  end

  def self.down
    remove_column :rubyists, :website
  end
end
