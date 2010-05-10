# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def url_of_paypal_checkout
    configatron.paypal.post_url
  end

  def current_locale
    I18n.locale
  end

  # TODO support :scope
  def t_required(locale_name)
    "#{t(locale_name)}&nbsp;<span class='required'>(#{t(:required)})</span>"
  end
end
