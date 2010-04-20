class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.references :order, :null => false
      t.references :product_item, :null => false
      t.integer :quantity, :null => false, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
