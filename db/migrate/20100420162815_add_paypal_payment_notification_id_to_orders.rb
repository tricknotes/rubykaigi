class AddPaypalPaymentNotificationIdToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :paypal_payment_notification_id, :integer
    remove_column :orders, :ipn_notified
  end

  def self.down
    remove_column :orders, :paypal_payment_notification_id
    add_column :orders, :ipn_notified, :boolean, :default => false, :null => false
  end
end
