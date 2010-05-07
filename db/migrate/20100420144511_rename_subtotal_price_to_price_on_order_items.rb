class RenameSubtotalPriceToPriceOnOrderItems < ActiveRecord::Migration
  def self.up
    rename_column :order_items, :subtotal_price, :price
  end

  def self.down
    rename_column :order_items, :price, :subtotal_price
  end
end
