class AddToCapacityAndPartyCapacityToRubyKaigis < ActiveRecord::Migration
  def self.up
    add_column :ruby_kaigis, :capacity, :integer, :null => false
    add_column :ruby_kaigis, :party_capacity, :integer, :null => false
  end

  def self.down
    remove_column :ruby_kaigis, :party_capacity
    remove_column :ruby_kaigis, :capacity
  end
end
