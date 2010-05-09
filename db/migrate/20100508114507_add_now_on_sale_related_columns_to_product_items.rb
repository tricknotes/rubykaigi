class AddNowOnSaleRelatedColumnsToProductItems < ActiveRecord::Migration
  def self.up
    add_column :product_items, :open_sale_at, :timestamp
    add_column :product_items, :ready_for_sale, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :product_items, :ready_for_sale
    remove_column :product_items, :open_sale_at
  end
end
