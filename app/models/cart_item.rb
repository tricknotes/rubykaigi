# -*- coding: utf-8 -*-
class CartItem
  attr_reader :product_item, :quantity
  attr_accessor :additional_amount
  attr_accessor :link_label
  attr_accessor :link_url
  attr_accessor :attend_party

  def initialize(product_item)
    @product_item = product_item
    @quantity = 1
    @additional_amount = 0
    @link_label = ""
    @link_url = ""
    @attend_party = false
  end

  def increment_quantity
    @quantity += 1
  end

  def unit_price
    @product_item.unit_price
  end

  def price
     unit_price + additional_amount
  end

  def subtotal_price
     price * quantity
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

  alias :attend_party? :attend_party
end
