require 'spec_helper'

describe RubyistsController do
  describe 'GET /rubyists/ursm' do
    before do
      @ursm = Rubyist.make(:name => 'ursm')
      get :show, :id => 'ursm'
    end

    it { response.should be_success }
    it { assigns[:rubyist].should == @ursm }
  end
end
