class Order < ActiveRecord::Base
  belongs_to :rubyist
  has_many :line_items, :class_name => OrderItem.name

  def add_line_item_from_cart(cart)
    cart.items.each do |item|
      li = OrderItem.from_cart_item(item)
      line_items << li
    end
  end
end
