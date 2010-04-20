class ProductItem < ActiveRecord::Base
  belongs_to :ruby_kaigi

  def available?
    0 < stock
  end

  def label
    "product_item.#{item_code}"
  end
end
