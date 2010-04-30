# -*- coding: utf-8 -*-
require 'spec_helper'

describe CartItem do
  before(:all) do
    @product = ProductItem.make(:price => 1000)
  end

  context "when single item" do
    before(:all) do
      @cart_item = CartItem.new(@product)
    end

    subject { @cart_item }
    its(:subtotal_price) { should == 1000 }
    its(:unit_price) { should == 1000 }
    its(:quantity) { should == 1 }
    its(:item_code) { should == @product.item_code }
  end

  context "when multiple item" do
    before(:all) do
      @cart_item = CartItem.new(@product)
      @cart_item.increment_quantity
    end

    subject { @cart_item }
    its(:subtotal_price) { should == 2000 }
    its(:unit_price) { should == 1000 }
    its(:quantity) { should == 2 }
  end
end
