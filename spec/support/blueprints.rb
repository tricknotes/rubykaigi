# -*- coding: utf-8 -*-
require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.username { Faker::Internet.user_name.gsub('.', '-') }
Sham.year(:unique => true) {|i| 2010 + i }
Sham.item_code(:unique => true) {|i| "item_#{i}" }

Rubyist.blueprint do
  username
end

Rubyist.blueprint :invalid do
  username { '' }
end

RubyKaigi.blueprint do
  year
  capacity { 0 }
  party_capacity { 0 }
end

HeadlineEntry.blueprint do
end

ProductItem.blueprint do
  item_code
  unit_price { 123 }
  stock { 10 }
  ruby_kaigi_id { 5 }
  open_sale_at { Time.now }
  ready_for_sale { false }
end

Order.blueprint do
  rubyist { Rubyist.make }
  ruby_kaigi_id { 5 }
  return_from_paypal { false }
  price { 0 }
end

OrderItem.blueprint do
  order { Order.make }
  product_item { ProductItem.make }
  quantity { 1 }
  price { 0 }
  attend_party { false }
end
