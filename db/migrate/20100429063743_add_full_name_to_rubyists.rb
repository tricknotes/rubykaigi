class AddFullNameToRubyists < ActiveRecord::Migration
  def self.up
    change_table :rubyists do |t|
      t.string :full_name
      t.rename :name, :username
    end

    add_index :rubyists, :username, :unique => true
  end

  def self.down
    remove_index :rubyists, :username

    change_table :rubyists do |t|
      t.remove :full_name
      t.rename :username, :name
    end
  end
end
