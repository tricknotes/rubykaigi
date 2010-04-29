class AddIdentityUrlToRubyists < ActiveRecord::Migration
  def self.up
    add_column :rubyists, :identity_url, :string
  end

  def self.down
    remove_column :rubyists, :identity_url
  end
end
