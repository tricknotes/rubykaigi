# -*- coding: utf-8 -*-
require 'spec_helper'

describe OrderItem do
  describe ".from_cart_item" do
    context "カートに複数のアイテムが入っている場合" do
      before do
        @product_item = ProductItem.make(:unit_price => 123)
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

    context "CartItemに付加的な情報が設定されている場合" do
      before(:all) do
        @cart_item = CartItem.new(ProductItem.make)
        @cart_item.link_label = "a label"
        @cart_item.link_url = "http://example.com"
        @cart_item.attend_party = true
      end

      subject { OrderItem.from_cart_item(@cart_item) }
      its(:link_label) { should == @cart_item.link_label }
      its(:link_url) { should == @cart_item.link_url }
      its(:attend_party) { should be_true }
    end
  end
end
