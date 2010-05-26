module OrdersHelper
  def checkout_paypal_button
#    checkout_paypal_button = (current_locale == "ja" ? image_tag("/2010/images/checkout_paypal_ja.png", :alt => "PayPalでチェックアウトする") : image_tag("/2010/images/checkout_paypal_en.png", :alt => "Checkout via PayPal"))
#    link_to(addtocart_button, orders_path, :method => :post, :class => 'noborder')
    checkout_paypal_button = (current_locale == "ja" ? "/2010/images/checkout_paypal_ja.png" : "/2010/images/checkout_paypal_en.png")
    image_submit_tag(checkout_paypal_button)
  end
end
