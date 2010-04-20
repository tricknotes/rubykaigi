class CreateProductItems < ActiveRecord::Migration
  def self.up
    create_table :product_items do |t|
      t.string :item_code, :null => false, :unique => true
      t.integer :price, :null => false
      t.integer :stock, :null => false, :default => 0
      t.references :ruby_kaigi, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :product_items
  end
end
