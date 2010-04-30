# -*- coding: utf-8 -*-
class CartItem
  attr_reader :product_item, :quantity
  attr_accessor :additional_amount

  def initialize(product_item)
    @product_item = product_item
    @quantity = 1
    @additional_amount = 0
  end

  def increment_quantity
    @quantity += 1
  end

  def unit_price
    @product_item.price + additional_amount
  end
  alias :price :unit_price

  def subtotal_price
     unit_price * quantity
  end

  def label
    @product_item.label
  end

  def item_code
    @product_item.item_code
  end

  def individual_sponsor?
    @product_item.individual_sponsor?
  end
end
