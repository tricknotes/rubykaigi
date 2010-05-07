require 'spec_helper'

describe Order do
  describe "#price" do
    before(:all) do
      stub(item = CartItem.new(ProductItem.make)).unit_price { 123 }
      @cart = Cart.new; @cart.items << item
      @order = Order.make
    end

    context "Cart has an item" do
      before(:all) do
        @order.add_line_item_from_cart(@cart)
        @order.save!
      end
      subject { @order }

      its(:price) { should == 123 }
    end

    context "Cart has multiple item" do
      before(:all) do
        2.times do
          @order.add_line_item_from_cart(@cart)
        end
        @order.save!
      end
      subject { @order }

      its(:price) { should == 246 }
    end

    context "Cart with additonal amounted product item" do
      before(:all) do
        @cart.items.first.additional_amount = 2000
        @order.add_line_item_from_cart(@cart)
        @order.save!
      end

      subject { @order }

      its(:price) { should == 2123 }
    end
  end
end
