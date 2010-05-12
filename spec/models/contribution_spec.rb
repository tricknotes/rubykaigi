# -*- coding: utf-8 -*-
require 'spec_helper'

describe Contribution do
  describe "#from_order" do
    before do
      @rk10_registration = ProductItem.make(
        :item_code => "rk10",
        :ruby_kaigi => RubyKaigi._2010,
        :stock => 20)
      @rk10_party = ProductItem.make(
        :item_code => "rk10_party",
        :ruby_kaigi => RubyKaigi._2010,
        :stock => 10)
      @kakutani = Rubyist.make(:username => 'kakutani')
      @individual_sponsor = ProductItem.make(
        :item_code => "rk10_individual_sponsor",
        :ruby_kaigi => RubyKaigi._2010,
        :stock => 5)
      @sponsor_option = IndividualSponsorOption.make_unsaved(
        :additional_amount => 0,
        :link_label => 'kakutani',
        :link_url => 'http://kakutani.com',
        :attend_party => true)
      @line_item = OrderItem.make(
        :product_item => @individual_sponsor,
        :unit_price => 25000,
        :quantity => 1,
        :individual_sponsor_option => @sponsor_option)
      @order = Order.make(
        :rubyist => @kakutani,
        :ruby_kaigi => RubyKaigi._2010,
        :line_items => [@line_item])
    end

    context "懇親会に参加するチェックをつけている" do
      before do
        @sponsor_option.update_attributes(
          :attend_party => true)
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

      shared_examples_for "本編には参加するが、懇親会には参加しない個人スポンサー" do
        it { should be_individual_sponsor(2010) }
        it { should be_attendee(2010) }
        it { should_not be_party_attendee(2010) }

        specify "個人スポンサーの在庫が1減っていること" do
          ProductItem.kaigi(2010).rk10_individual_sponsor.stock.should == 4
        end

        specify "本編参加の在庫は減っていないこと(チケットの販売枚数は減らさない)" do
          ProductItem.kaigi(2010).rk10.stock.should == 20
        end
      end

      context "懇親会チケットの在庫がない" do
        before do
          @rk10_party.update_attributes(:stock => 0)
          Contribution.from_order(@order)
        end

        subject { @kakutani }

        it_should_behave_like "本編には参加するが、懇親会には参加しない個人スポンサー"

        specify "懇親会チケットの在庫は0より減ってないこと" do
          ProductItem.kaigi(2010).rk10_party.stock.should == 0
        end
      end

      describe "個人スポンサーに関する情報を取得できる" do
        before do
          @rk10_party.update_attributes(:stock => 10)
          Contribution.from_order(@order)
        end

        subject { @kakutani.individual_sponsor(2010) }

        its(:amount) { should == 25000 }
        its(:link_label) { should == 'kakutani' }
        its(:link_url) { should == 'http://kakutani.com' }
      end
    end

    context "懇親会に参加する、のチェックをつけてない" do
      before do
        @sponsor_option.update_attributes(
          :attend_party => false)
        Contribution.from_order(@order)
      end

      subject { @kakutani }

      it_should_behave_like "本編には参加するが、懇親会には参加しない個人スポンサー"

      specify "懇親会チケットの在庫は減らないこと" do
        ProductItem.kaigi(2010).rk10_party.stock.should == 10
      end
    end

    context "同じRubyKaigiの開催で2回個人スポンサーに応募した場合" do
      specify do
        expect {
          2.times { Contribution.from_order(@order) }
        }.to raise_error Contribution::DuplicationError
      end
    end
  end
end

describe Contribution do
  describe "#authorize_as_staff" do
    before do
      @kakutani = Rubyist.make(:username => 'kakutani')
    end
    subject { @kakutani }

    it { should_not be_staff(2010) }

    context "Contributionが正常に作成した場合" do
      before do
        Contribution.authorize_as_staff(@kakutani, 2010)
      end
      it { should be_staff(2010) }
    end

    context "Contributionを二重に作成した場合" do
      before do
        Contribution.authorize_as_staff(@kakutani, 2010)
      end

      specify {
        expect {
          Contribution.authorize_as_staff(@kakutani, 2010)
        }.to raise_error(Contribution::DuplicationError)
      }

      it { should be_staff(2010) }
    end

  end
end
