class AddInvoiceToPaypalPaymentNotifications < ActiveRecord::Migration
  def self.up
    add_column :paypal_payment_notifications, :invoice, :string
  end

  def self.down
    remove_column :paypal_payment_notifications, :invoice
  end
end
