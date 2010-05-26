# -*- coding: utf-8 -*-
module CartsHelper
  def proceed_to_checkout_button
    addtocart_button = (current_locale == "ja" ? image_tag("/2010/images/proceedtocheckout_ja.png", :alt => "購入手続きへ進む") : image_tag("/2010/images/proceedtocheckout_en.png", :alt => "Proceed To Checkout"))
    link_to(addtocart_button, orders_path, :method => :post, :class => 'noborder')
  end
end
