%w(ruby_kaigis product_items).each do |t|
  ActiveRecord::Base.connection.execute("truncate #{t}")
  ActiveRecord::Base.connection.reset_sequence!(t, 'id')
end

rk10 = RubyKaigi.create(:year => 2010, :capacity => 900, :party_capacity => 310)
ProductItem.create(:item_code => 'rk10', :price => 6000, :stock => 700, :ruby_kaigi_id => rk10)
ProductItem.create(:item_code => 'rk10_party', :price => 5000, :stock => 150, :ruby_kaigi_id => rk10)
ProductItem.create(:item_code => 'rk10_individual_sponsor', :price => 20000, :stock => 9999, :ruby_kaigi_id => rk10)
