class RemoveOrderIdFromPaypalPaymentNotifications < ActiveRecord::Migration
  def self.up
    remove_column :paypal_payment_notifications, :order_id
    rename_column :paypal_payment_notifications, :notified_params, :notified_params_as_json
  end

  def self.down
    add_column :paypal_payment_notifications, :order_id, :integer, :null => false
    rename_column :paypal_payment_notifications, :notified_params_as_json, :notified_params
  end
end
