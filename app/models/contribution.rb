# -*- coding: utf-8 -*-
class Contribution < ActiveRecord::Base
  class OrderNotCompletedError < StandardError; end
  class DuplicationError < StandardError; end

  class Type
    class << self
      %w[attendee individual_sponsor party_attendee staff].each do |_type|
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
      validate_order_is_completed

      if individual_sponsor_included?
        # TODO なんかこのへん年ごとに依存してるなあ。年毎のオブジェクトにdouble dispatchしたほうがいいんかな。
        individual_sponsor = build_contribution_for(Contribution::Type.individual_sponsor).as_individual_sponsor
        rk10_individual_sponsor = ProductItem.kaigi(2010).rk10_individual_sponsor
        rk10_individual_sponsor.stock -= 1

        rk10_party = ProductItem.kaigi(2010).rk10_party
        if individual_sponsor.attend_party? && !rk10_party.sold_out?
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
      contrib = Contribution.find(:first,
        :conditions => ["contribution_type = ? AND rubyist_id = ? AND ruby_kaigi_id = ?",
          contribution_type, order.rubyist.id, order.ruby_kaigi.id])
      if contrib
        raise(DuplicationError,
          "#{order.rubyist.username}(order_id: #{order.id}) is arleady individual sponsor for rubykaigi #{order.ruby_kaigi.year}")
      end
      Contribution.new(
        :contribution_type => contribution_type,
        :rubyist => order.rubyist,
        :ruby_kaigi => order.ruby_kaigi,
        :order_item => extract_individual_sponsor_order_item)
    end

    def validate_order_is_completed
      unless order.completed?
        raise(OrderNotCompletedError,
          "#{order.rubyist.username}(order_id: #{order.id})'s order was not completed for rubykaigi #{order.ruby_kaigi.year}")
      end
    end

  end # FromOrder

  class AuthorizeAsStaff
    attr_reader :rubyist, :year
    def initialize(rubyist, year)
      @rubyist = rubyist
      @year = year
    end

    def update!
      if already_exist?
        raise DuplicationError, "#{rubyist.username} is arleady staff for rubykaigi #{year}"
      end
      create_contribution_for(Contribution::Type.staff)
    end

    private
    def already_exist?
      Contribution.find(:first, :include => :ruby_kaigi,
        :conditions => [
          "rubyist_id = ? AND ruby_kaigis.year = ? AND contribution_type = ?",
          rubyist.id, year, Contribution::Type.staff])
    end

    def create_contribution_for(contribution_type)
      Contribution.create!(
        :contribution_type => contribution_type,
        :rubyist => rubyist,
        :ruby_kaigi => RubyKaigi.year(year)
        )
    end
  end

  module IndividualSponsorInstanceMethods
    def amount
      order_item.price
    end

    def link_label
      return order_item.link_label if order_item.link_label.present?
      return rubyist.full_name if rubyist.full_name.present?
      rubyist.username
    end

    def link_url
      order_item.link_url || rubyist.website
    end

    def attend_party?
      order_item.attend_party?
    end
  end # IndividualSponsorInstanceMethods

  belongs_to :rubyist
  belongs_to :ruby_kaigi
  belongs_to :order_item
  class << self
    def from_order(order)
      Contribution::FromOrder.new(order).create
    end

    def authorize_as_staff(rubyist, kaigi_year = RubyKaigi.latest_year)
      Contribution::AuthorizeAsStaff.new(rubyist, kaigi_year).update!
    end

    def individual_sponsors_of(kaigi_year = RubyKaigi.latest_year)
      Contribution.all(:include => [:order_item, :ruby_kaigi],
        :conditions => ["contribution_type = ? AND ruby_kaigis.year = ?", "individual_sponsor", kaigi_year]).
        map(&:as_individual_sponsor).sort_by { |e| e.amount }.reverse
    end
  end

  def as_individual_sponsor
    self.extend(IndividualSponsorInstanceMethods)
  end
end
