require 'spec_helper'

describe RubyKaigi do
  before(:each) do
    @valid_attributes = {
      :year => 1
    }
  end

  it "should create a new instance given valid attributes" do
    RubyKaigi.create!(@valid_attributes)
  end
end
