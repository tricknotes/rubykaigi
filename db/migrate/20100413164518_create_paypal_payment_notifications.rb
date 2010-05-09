class CreatePaypalPaymentNotifications < ActiveRecord::Migration
  def self.up
    create_table :paypal_payment_notifications do |t|
      t.string :payment_status, :null => false
      t.string :txn_id
      t.string :receipt_id
      t.string :payer_email
      t.string :last_name
      t.string :first_name
      t.string :payer_id
      t.string :address_zip
      t.string :address_state
      t.string :address_city
      t.string :address_street
      t.string :address_name
      t.string :payment_date
      t.integer :tax
      t.text :notified_params, :null => false
      t.references :order, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :paypal_payment_notifications
  end
end
