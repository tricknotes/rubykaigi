class OrderItem < ActiveRecord::Base
  belongs_to :product_item
  belongs_to :order

  class << self
    def from_cart_item(cart_item)
      li = new
      li.product_item = cart_item.product_item
      li.quantity = cart_item.quantity
      li.price = cart_item.price
      li
    end
  end
end
