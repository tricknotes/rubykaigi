require 'spec_helper'

describe PaypalController do

  #Delete this example and add some real ones
  it "should use PaypalController" do
    controller.should be_an_instance_of(PaypalController)
  end


  def ipn_anonymous_single_item
    HWIA.new({
'action' => 'instant_payment_notification',
'address_city' => '台東区','address_country' => 'Japan',
'address_country_code' => 'JP','address_name' => 'Shintaro Kakutani',
'address_state' => 'TOKYO','address_status' => 'unconfirmed',
'address_street' => '上野2-7-7上野HSビル 8F',
'address_zip' => '110-0005','business' => 'paypal_1271051243_biz@rubykaigi.org',
'charset' => 'UTF-8','controller' => 'paypal',
'custom' => '','first_name' => 'Shintaro',
'invoice' => '5','item_name1' => 'RubyKaigi 2010 Individual Sponsor',
'item_number1' => 'rk10_individual_sponsor','last_name' => 'Kakutani',
'mc_currency' => 'JPY','mc_fee' => '820',
'mc_gross' => '20000','mc_gross_1' => '20000','mc_handling' => '0','mc_handling1' => '0',
'mc_shipping' => '0','mc_shipping1' => '0',
'notify_version' => '2.9','num_cart_items' => '1',
'payer_email' => 'shintaro.kakutani@gmail.com','payer_id' => 'UKHCYWLY47J2N',
'payer_status' => 'unverified','payment_date' => '04:08:55 Apr 28, 2010 PDT',
'payment_fee' => '','payment_gross' => '',
'payment_status' => 'Completed','payment_type' => 'instant',
'protection_eligibility' => 'PartiallyEligible','quantity1' => '1',
'receipt_id' => '1892-3990-0603-6334','receiver_email' => 'paypal_1271051243_biz@rubykaigi.org',
'receiver_id' => 'FS8WKQCD7NW9G','residence_country' => 'JP',
'secret' => '#<Configatron::Store:0x7fce7c87de10>',
'tax' => '0',
'tax1' => '0',
'test_ipn' => '1',
'transaction_subject' => 'Shopping Cart',
'txn_id' => '7AE1701675170101C',
'txn_type' => 'cart',
'verify_sign' => 'AiPC9BjkCyDFQXbSkoZcgqH3hpacAShI6hEjLYnTABYV-5feOhtFIndQ',
    })
  end

  def ipn_account_single_item
    HWIA.new({'action' => 'instant_payment_notification',
'address_city' => 'San Jose','address_country' => 'United States',
'address_country_code' => 'US','address_name' => 'Test User',
'address_state' => 'CA','address_status' => 'confirmed',
'address_street' => '1 Main St','address_zip' => '95131',
'business' => 'paypal_1271051243_biz@rubykaigi.org','charset' => 'UTF-8',
'controller' => 'paypal','custom' => '',
'first_name' => 'Test','invoice' => '8',
'item_name1' => 'RubyKaigi 2010 Individual Sponsor','item_number1' => 'rk10_individual_sponsor',
'last_name' => 'User','mc_currency' => 'JPY',
'mc_fee' => '620','mc_gross' => '20000','mc_gross_1' => '20000','mc_handling' => '0',
'mc_handling1' => '0','mc_shipping' => '0',
'mc_shipping1' => '0','notify_version' => '2.9',
'num_cart_items' => '1','payer_email' => 'paypal_1272454080_per@rubykaigi.org',
'payer_id' => 'RKLPADMH6UH9U','payer_status' => 'verified',
'payment_date' => '04:33:08 Apr 28, 2010 PDT','payment_fee' => '',
'payment_gross' => '','payment_status' => 'Completed',
'payment_type' => 'instant','protection_eligibility' => 'Eligible',
'quantity1' => '1','receiver_email' => 'paypal_1271051243_biz@rubykaigi.org',
'receiver_id' => 'FS8WKQCD7NW9G','residence_country' => 'US',
'secret' => '#<Configatron::Store:0x7fce7cdfa460>',
'tax' => '0',
'tax1' => '0',
'test_ipn' => '1',
'transaction_subject' => 'Shopping Cart',
'txn_id' => '5D7253191T504614X',
'txn_type' => 'cart',
'verify_sign' => 'AIwztZKAwmYb7ZUbStdZQnFXFVzFAfsmlAYFX8raeTXURVKKcHsh1yz9',
})
  end
end
