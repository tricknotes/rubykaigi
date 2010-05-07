class OrdersController < ApplicationController
  def create
    @order = Order.new(:rubyist => user)
    @order.add_line_item_from_cart(session[:cart])
    if @order.save
      session[:order_id] = @order.id
      redirect_to confirm_orders_path
    else
      flash[:error] = t('flash.order.save.fail')
      redirect_to carts_path
    end
  end

  def confirm
    @order = Order.find(session[:order_id])
    @paypal_form = Paypal::EncryptedForm.new(@order,
      thanks_orders_url, paypal_ipn_url(:secret => Paypal::EncryptedForm.ipn_secret))
    unless @order
      flash[:error] = t('flash.order.notfound')
      redirect_to carts_path
    end
  end

  def thanks
    render :text => 'thanks!'
  end
end
