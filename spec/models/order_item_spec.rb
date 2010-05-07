# -*- coding: utf-8 -*-
require 'spec_helper'

describe OrderItem do
  context "multiple item" do
    before do
      @product_item = ProductItem.make(:price => 123)
      cart = Cart.new
      2.times do
        cart.add_product(@product_item)
      end
      @order_item = OrderItem.from_cart_item(cart.items.first)
    end
    subject { @order_item }

    its(:item_code) { should == @product_item.item_code }
    its(:unit_price) { should == 123 }
    its(:quantity) { should == 2 }
    its(:subtotal_price) { should == 246 }
  end
end
