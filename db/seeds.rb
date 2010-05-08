%w(ruby_kaigis product_items).each do |t|
  klass = t.classify.constantize
  klass.delete_all
  ActiveRecord::Base.connection.reset_sequence!(t, 'id')
end

(2006..2009).to_a.each do |year|
  RubyKaigi.create(:year => year, :capacity => 0, :party_capacity => 0)
end
rk10 = RubyKaigi.create(:year => 2010, :capacity => 900, :party_capacity => 310)
ProductItem.create(:item_code => 'rk10', :unit_price => 6000, :stock => 700, :ruby_kaigi => rk10,
  :open_sale_at => DateTime.parse('2010-06-15 19:00:00'), :ready_for_sale => true)
ProductItem.create(:item_code => 'rk10_party', :unit_price => 5000, :stock => 150, :ruby_kaigi => rk10,
  :open_sale_at => DateTime.parse('2010-06-15 19:00:00'), :ready_for_sale => true)
ProductItem.create(:item_code => 'rk10_individual_sponsor', :unit_price => 20000, :stock => 100, :ruby_kaigi => rk10,
  :open_sale_at => DateTime.parse('2010-05-07 19:00:00'), :ready_for_sale => true)
