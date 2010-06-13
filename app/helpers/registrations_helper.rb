module RegistrationsHelper
  def img_add_to_cart_button
    file_path = "/2010/images/addtocart_#{current_locale}.png"
    alt = (current_locale == "ja" ? "カートへ入れる" : "Add To Cart")
    image_tag(file_path, :alt => alt)
  end
end
