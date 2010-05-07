class AddSubtotalPriceToOrderItems < ActiveRecord::Migration
  def self.up
    add_column :order_items, :subtotal_price, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :order_items, :subtotal_price
  end
end
