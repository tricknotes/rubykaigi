class CartItem
  attr_reader :product_item, :quantity

  def initialize(product_item)
    @product_item = product_item
    @quantity = 1
  end

  def increment_quantity
    @quantity += 1
  end

  def price
    @product_item.price * @quantity
  end

  def label
    @product_item.label
  end

  def item_code
    @product_item.item_code
  end
end
