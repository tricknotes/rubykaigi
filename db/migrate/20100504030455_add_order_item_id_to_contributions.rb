class AddOrderItemIdToContributions < ActiveRecord::Migration
  def self.up
    add_column :contributions, :order_item_id, :integer
  end

  def self.down
    remove_column :contributions, :order_item
  end
end
