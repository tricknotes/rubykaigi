# -*- coding: utf-8 -*-
require 'spec_helper'

describe Cart do
  before(:all) do
    @cart = Cart.new
    @product1 = ProductItem.make(:price => 1000)
    @product2 = ProductItem.make(:price => 200)
  end

  context "when single item" do
    before(:all) do
      @cart.add_product(@product1)
    end

    subject { @cart }
    its(:total_price) { should == 1000 }
    its(:total_items) { should == 1 }
    it { should_not be_empty }
  end

  context "when multiple items" do
    before(:all) do
      @cart.add_product(@product1)
      @cart.add_product(@product1)
      @cart.add_product(@product2)
    end

    subject { @cart }
    its(:total_price) { should == 2200 }
    its(:total_items) { should == 3 }
    it { should_not be_empty }
  end
end
