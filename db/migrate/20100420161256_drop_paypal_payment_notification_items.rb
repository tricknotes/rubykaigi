class DropPaypalPaymentNotificationItems < ActiveRecord::Migration
  def self.up
    drop_table :paypal_payment_notification_items
  end

  def self.down
    create_table :paypal_payment_notification_items do |t|
      t.references :paypal_payment_notification_id, :null => false
      t.string :item_name, :null => false
      t.string :item_number, :null => false
      t.integer :mc_gross, :null => false
      t.integer :quantity, :null => false

      t.timestamps
    end
  end
end
