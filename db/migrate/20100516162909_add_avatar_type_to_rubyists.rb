class AddAvatarTypeToRubyists < ActiveRecord::Migration
  def self.up
    add_column :rubyists, :avatar_type, :string, :null => false, :default => 'default'
  end

  def self.down
    remove_column :rubyists, :avatar_type
  end
end
