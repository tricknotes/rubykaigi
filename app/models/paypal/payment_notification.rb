module Paypal
  class PaymentNotification
    class Item < ActiveRecord::Base
      set_table_name "paypal_payment_notification_items"

      belongs_to :paypal_payment_notification, :class => Paypal::PaymentNotification
      alias :name :item_name
      alias :number :item_number
      alias :price :mc_gross
    end # Item

    set_table_name "paypal_payment_notifications"
    belongs_to :order
    has_many :items, :class => Paypal::PaymentNotification::Item
  end
end
