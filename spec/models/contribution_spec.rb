# -*- coding: utf-8 -*-
require 'spec_helper'

describe Contribution do
  describe "#from_order" do
    context "individual sponsor" do
      before do
        @kakutani = Rubyist.make(:username => 'kakutani')
        @individual_sponsor = ProductItem.make(
          :item_code => "rk10_individual_sponsor",
          :ruby_kaigi => RubyKaigi._2010,
          :stock => 5)
        line_item = OrderItem.make(
          :product_item => @individual_sponsor)
        @order = Order.make(
          :rubyist => @kakutani,
          :ruby_kaigi => RubyKaigi._2010,
          :line_items => [line_item])
        @rk10_registration = ProductItem.make(
          :item_code => "rk10",
          :ruby_kaigi => RubyKaigi._2010,
          :stock => 20)
        @rk10_party = ProductItem.make(
          :item_code => "rk10_party",
          :ruby_kaigi => RubyKaigi._2010,
          :stock => 10)
      end
      context "懇親会の在庫がある" do
        before do
          @rk10_party.update_attributes(:stock => 10)
          Contribution.from_order(@order)
        end

        subject { @kakutani }

        it { should be_individual_sponsor(2010) }
        it { should be_attendee(2010) }
        it { should be_party_attendee(2010) }

        specify "個人スポンサーの在庫が1減っていること" do
          ProductItem.kaigi(2010).rk10_individual_sponsor.stock.should == 4
        end

        specify "本編参加の在庫は減っていないこと(チケットの販売枚数は減らさない)" do
          ProductItem.kaigi(2010).rk10.stock.should == 20
        end

        specify "懇親会チケットの在庫は減っていること" do
          ProductItem.kaigi(2010).rk10_party.stock.should == 9
        end
      end

      context "懇親会の在庫がない" do
        before do
          @rk10_party.update_attributes(:stock => 0)
          Contribution.from_order(@order)
        end

        subject { @kakutani }

        it { should be_individual_sponsor(2010) }
        it { should be_attendee(2010) }
        it { should_not be_party_attendee(2010) }

        specify "個人スポンサーの在庫が1減っていること" do
          ProductItem.kaigi(2010).rk10_individual_sponsor.stock.should == 4
        end

        specify "本編参加の在庫は減っていないこと(チケットの販売枚数は減らさない)" do
          ProductItem.kaigi(2010).rk10.stock.should == 20
        end

        specify "懇親会チケットの在庫は0のままであること" do
          ProductItem.kaigi(2010).rk10_party.stock.should == 0
        end
      end
    end
  end
end
