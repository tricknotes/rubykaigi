class RenamePriceOnOrderItems < ActiveRecord::Migration
  def self.up
    rename_column :order_items, :price, :unit_price
  end

  def self.down
    rename_column :order_items, :unit_price, :price
  end
end
