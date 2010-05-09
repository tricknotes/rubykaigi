class AddInvoideCodeToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :invoice_code, :string, :null => false, :unique => true
  end

  def self.down
    remove_column :orders, :invoice_code
  end
end
