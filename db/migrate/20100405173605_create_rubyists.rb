class CreateRubyists < ActiveRecord::Migration
  def self.up
    create_table :rubyists do |t|
      t.string :name, :unique => true
      t.string :email
      t.integer :twitter_user_id, :unique => true

      t.timestamps
    end
  end

  def self.down
    drop_table :rubyists
  end
end
