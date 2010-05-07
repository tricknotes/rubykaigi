class CartsController < ApplicationController
  def index
    @cart = (session[:cart] ||= Cart.new)
  end

  def update
    @cart = session[:cart]
    if (sponsor_item = @cart.individual_sponsor)
      amount = params[:cart][:cart_item][:additional_amount].to_i
      sponsor_item.additional_amount = amount
    end
    redirect_to carts_path
  end

  def add_item
    cart = (session[:cart] ||= Cart.new)
    product_item = ProductItem.find_by_item_code(params[:product_item_code])
    unless product_item
      # TODO handle flash
      redirect_to registrations_url
      return
    end
    cart.add_product(product_item)
    redirect_to carts_path
  end

  def remove_item
    cart = session[:cart]
    unless cart
      redirect_to carts_url
    end
    product_item = ProductItem.find_by_item_code(params[:product_item_code])
    cart.remove_product(product_item)
    redirect_to carts_path
  end

end
