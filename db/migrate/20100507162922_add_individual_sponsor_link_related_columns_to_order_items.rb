class AddIndividualSponsorLinkRelatedColumnsToOrderItems < ActiveRecord::Migration
  def self.up
    add_column :order_items, :link_label, :string
    add_column :order_items, :link_url, :string
  end

  def self.down
    remove_column :order_items, :link_url
    remove_column :order_items, :link_label
  end
end
