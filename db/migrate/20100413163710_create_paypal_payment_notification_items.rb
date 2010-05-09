class CreatePaypalPaymentNotificationItems < ActiveRecord::Migration
  def self.up
    create_table :paypal_payment_notification_items do |t|
      t.references :paypal_payment_notification_id, :null => false
      t.string :item_name, :null => false
      t.string :item_number, :null => false
      t.integer :mc_gross, :null => false
      t.integer :quantity, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :paypal_payment_notification_items
  end
end
