require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.username { Faker::Internet.user_name }
Sham.year {|i| 2010 + i }

Rubyist.blueprint do
  username
end

RubyKaigi.blueprint do
  year
  capacity { 0 }
  party_capacity { 0 }
end

HeadlineEntry.blueprint do
end

ProductItem.blueprint do
  item_code {|i| "item_#{i}" }
  price { 123 }
  stock { 10 }
  ruby_kaigi { RubyKaigi.make }
end

Order.blueprint do
  rubyist { Rubyist.make }
end
