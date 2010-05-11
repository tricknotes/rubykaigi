require 'spec_helper'

describe Order do
  describe "#price" do
    before(:all) do
      stub(item = CartItem.new(ProductItem.make)).unit_price { 123 }
      @cart = Cart.new; @cart.items << item
      @order = Order.make
    end

    subject { @order }

    its(:invoice_code) { should_not be_nil }

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
  end
end
