require 'spec_helper'

describe Order do
  before(:each) do
    @valid_attributes = {
      :rubyist_id => 1,
      :return_from_paypal => false,
      :ipn_notified => false
    }
  end

  it "should create a new instance given valid attributes" do
    Order.create!(@valid_attributes)
  end
end
