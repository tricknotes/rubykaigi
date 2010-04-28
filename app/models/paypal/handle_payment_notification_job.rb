# -*- coding: utf-8 -*-
module Paypal
  class HandlePaymentNotificationJob
    def initialize(order_id)
      @order_id = order_id
    end

    def perform
      order = Order.find(@order_id)
      Contribution.from_order(order)
    end
  end
end
