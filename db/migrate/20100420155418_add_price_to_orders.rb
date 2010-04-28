class AddPriceToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :price, :integer, :null => false
  end

  def self.down
    remove_column :orders, :price
  end
end
