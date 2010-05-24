# -*- coding: utf-8 -*-
class CartsController < ApplicationController
  layout_for_latest_ruby_kaigi
  before_filter :login_required, :only => :index

  def index
    @cart = (session[:cart] ||= Cart.new)
  end

  def update
    @cart = session[:cart]
    redirect_to carts_path
  end

  def add_item
    cart = (current_cart)
    product_item = ProductItem.find_by_item_code(params[:product_item_code])
    unless product_item
      # TODO handle flash
      redirect_to(registrations_url(:year => RubyKaigi.latest_year, :locale => current_locale)) and return
    end
    if authenticated? && user.individual_sponsor?
      flash[:error] = "You're already Individual Sponsor of RubyKaigi #{RubyKaigi.latest_year}"
      redirect_to(registrations_url(:year => RubyKaigi.latest_year, :locale => current_locale)) and return
    end

    cart.add_product(product_item)
    redirect_to carts_path
  end

  def remove_item
    cart = current_cart
    product_item = ProductItem.find_by_item_code(params[:product_item_code])
    cart.remove_product(product_item)
    redirect_to carts_path
  end

end
