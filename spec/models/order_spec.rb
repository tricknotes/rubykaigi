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
  end
end
