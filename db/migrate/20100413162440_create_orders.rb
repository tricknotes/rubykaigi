class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.references :rubyist, :null => false
      t.boolean :return_from_paypal, :null => false, :default => false
      t.boolean :ipn_notified, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
