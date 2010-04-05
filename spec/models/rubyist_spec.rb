require 'spec_helper'

describe Rubyist do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :email => "value for email",
      :oauth_token => "value for oauth_token",
      :oauth_secret => "value for oauth_secret"
    }
  end

  it "should create a new instance given valid attributes" do
    Rubyist.create!(@valid_attributes)
  end
end
