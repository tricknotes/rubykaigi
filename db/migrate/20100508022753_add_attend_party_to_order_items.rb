class AddAttendPartyToOrderItems < ActiveRecord::Migration
  def self.up
    add_column :order_items, :attend_party, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :order_items, :attend_party
  end
end
