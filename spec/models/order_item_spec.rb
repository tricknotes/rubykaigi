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
  end

  describe "#price" do
    def make_simple_cart
      @product_item = ProductItem.make(:unit_price => 123)
      @cart = Cart.new
      @cart.add_product(@product_item)
      @cart
    end

    context "通常の商品の場合" do
      before do
        make_simple_cart
        @order_item = OrderItem.from_cart_item(@cart.items.first)

        @product_item_unit_price = @order_item.product_item.unit_price
      end
      subject { @order_item.price }
      it { should == @product_item_unit_price }
    end

    context "個人スポンサーオプションがついている場合" do
      before do
        make_simple_cart
        cart_item = @cart.items.first
        stub(cart_item).individual_sponsor? { true }

        @order_item = OrderItem.from_cart_item(cart_item)

        @order_item.individual_sponsor_option.additional_amount = 3000
      end

      subject { @order_item.price }
      it { should == 3123 }
    end
  end
end
