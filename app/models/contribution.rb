class Contribution < ActiveRecord::Base
  belongs_to :rubyist
  belongs_to :ruby_kaigi

  class << self
    def from_order(order)
      # orderから購入したチケットの内容を判定する
      # 適切なcontributionを作成する
      # (個人スポンサーのときは券種に注意)
      # 有効な枚数から1減らす
    end
  end
end
