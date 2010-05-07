class RenamePriceToUnitPriceOnProductItems < ActiveRecord::Migration
  def self.up
    rename_column :product_items, :price, :unit_price
  end

  def self.down
    rename_column :product_items, :unit_price, :price
  end
end
