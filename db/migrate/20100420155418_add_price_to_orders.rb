class AddPriceToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :price, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :orders, :price
  end
end
