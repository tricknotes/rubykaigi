require 'spec_helper'

describe Rubyist do
  describe 'to_param' do
    subject { Rubyist.new(:name => 'ursm') }
    its(:to_param) { should == 'ursm' }
  end
end
