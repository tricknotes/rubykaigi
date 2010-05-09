require 'spec_helper'

describe ProductItem do
  describe "#now_on_sale?" do
    context "販売開始時刻を過ぎている" do
      before { product_item_with(:open_sale_at => 1.minute.ago) }

      context "販売準備完了フラグが立っている" do
        before { @subject.ready_for_sale = true }
        it { should be_now_on_sale }
      end

      context "販売準備完了フラグが立ってない" do
        before { @subject.ready_for_sale = false }
        it { should_not be_now_on_sale }
      end
    end

    context "販売開始時刻をまだ過ぎていない" do
      before { product_item_with(:open_sale_at => 30.minutes.from_now) }

      context "販売準備完了フラグが立っている" do
        before { @subject.ready_for_sale = true }
        it { should_not be_now_on_sale }
      end

      context "販売準備完了フラグが立ってない" do
        before { @subject.ready_for_sale = false }
        it { should_not be_now_on_sale }
      end
    end

    def product_item_with(attrs)
      @subject = ProductItem.make_unsaved(attrs)
    end
  end
end
