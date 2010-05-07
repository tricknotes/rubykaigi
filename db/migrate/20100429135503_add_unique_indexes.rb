class AddUniqueIndexes < ActiveRecord::Migration
  def self.up
    add_index :rubyists, :twitter_user_id, :unique => true
    add_index :rubyists, :identity_url, :unique => true
    add_index :ruby_kaigis, :year, :unique => true
    add_index :product_items, :item_code, :unique => true
  end

  def self.down
    remove_index :rubyists, :twitter_user_id
    remove_index :rubyists, :identity_url
    remove_index :ruby_kaigis, :year
    remove_index :product_items, :item_code
  end
end
