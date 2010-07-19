class AddPasswordCredentialToRubyists < ActiveRecord::Migration
  def self.up
    add_column :rubyists, :crypted_password, :string
  end

  def self.down
    remove_column :rubyists, :crypted_password
  end
end
