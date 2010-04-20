module Paypal
  class PaymentNotification < ActiveRecord::Base
    class Item < ActiveRecord::Base
      set_table_name "paypal_payment_notification_items"

      belongs_to :paypal_payment_notification, :class_name => Paypal::PaymentNotification.name

      def name
         item_name
      end

      def number
         item_number
      end

      def price
         mc_gross
      end
    end # Item

    set_table_name "paypal_payment_notifications"
    belongs_to :order
    has_many :items, :class_name => Paypal::PaymentNotification::Item.name
  end
end
