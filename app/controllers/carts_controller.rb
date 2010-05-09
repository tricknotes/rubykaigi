class CartsController < ApplicationController
  def index
    @cart = (session[:cart] ||= Cart.new)
  end

  def update
    @cart = session[:cart]
    if (sponsor_item = @cart.individual_sponsor)
      amount = params[:cart][:cart_item][:additional_amount].to_i
      link_label = params[:cart][:cart_item][:link_label]
      link_url = params[:cart][:cart_item][:link_url]
      attend_party = (params[:cart][:cart_item][:attend_party] == "1")
      sponsor_item.additional_amount = amount
      sponsor_item.link_label = link_label unless link_label.blank?
      sponsor_item.link_url = link_url unless link_url.blank?
      sponsor_item.attend_party = attend_party
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
