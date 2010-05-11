class RemoveOldSponsorOptionColumnsFromOrderItems < ActiveRecord::Migration
  def self.up
    remove_column :order_items, :attend_party
    remove_column :order_items, :link_label
    remove_column :order_items, :link_url
  end

  def self.down
    add_column :order_items, :link_label, :string
    add_column :order_items, :link_url, :string
    add_column :order_items, :attend_party, :boolean, :default => false, :null => false
  end
end
