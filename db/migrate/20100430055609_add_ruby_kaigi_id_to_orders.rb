class AddRubyKaigiIdToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :ruby_kaigi_id, :integer, :null => false, :default => 5
  end

  def self.down
    remove_column :orders, :ruby_kaigi_id
  end
end
