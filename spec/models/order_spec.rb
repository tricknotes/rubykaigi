require 'spec_helper'

describe Order do
  describe "#price" do
    context "Cart has an item" do
      before do
        stub(cart = Cart.new).items {
          stub(item = CartItem.new(ProductItem.make)).price { 123 }
          [item]
        }
        @order = Order.make
        @order.add_line_item_from_cart(cart)
        @order.save!
      end
      subject { @order }

      its(:price) { should == 123 }
    end

    context "Cart has multiple item" do
      before do
        stub(cart = Cart.new).items {
          stub(item = CartItem.new(ProductItem.make)).price { 123 }
          [item]
        }
        @order = Order.make
        2.times do
          @order.add_line_item_from_cart(cart)
        end
        @order.save!
      end
      subject { @order }

      its(:price) { should == 246 }
    end

  end
end
