# -*- coding: utf-8 -*-
class Contribution < ActiveRecord::Base
  class Type
    class << self
      %w[attendee individual_sponsor party_attendee].each do |_type|
        define_method(_type) { _type }
      end
    end
  end # Type

  class FromOrder
    attr_reader :order

    def initialize(order)
      @order = order
    end

    def create
      if individual_sponsor_included?
        # TODO なんかこのへん年ごとに依存してるなあ。年毎のオブジェクトにdouble dispatchしたほうがいいんかな。
        individual_sponsor = build_contribution_for(Contribution::Type.individual_sponsor)
        rk10_individual_sponsor = ProductItem.kaigi(2010).rk10_individual_sponsor
        rk10_individual_sponsor.stock -= 1

        rk10_party = ProductItem.kaigi(2010).rk10_party
        unless rk10_party.sold_out?
          party_attendee = build_contribution_for(Contribution::Type.party_attendee)
          rk10_party.stock -= 1
        end

        Contribution.transaction do
          [individual_sponsor, party_attendee, rk10_individual_sponsor, rk10_party].compact.each(&:save!)
        end
      else
        raise "This type of contribution does not supported: order id '#{order.id}'"
      end
    end

    private
    def individual_sponsor_included?
      !!extract_individual_sponsor_order_item
    end

    def extract_individual_sponsor_order_item
      order.line_items.detect {|o| o.item_code =~ /individual_sponsor/ }
    end

    def build_contribution_for(contribution_type)
      Contribution.new(
        :contribution_type => contribution_type,
        :rubyist => order.rubyist,
        :ruby_kaigi => order.ruby_kaigi,
        :order_item => extract_individual_sponsor_order_item)
    end

  end # FromOrder

  belongs_to :rubyist
  belongs_to :ruby_kaigi
  belongs_to :order_item
  class << self
    def from_order(order)
      Contribution::FromOrder.new(order).create
    end
  end
end
