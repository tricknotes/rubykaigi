require 'spec_helper'

describe Rubyist do
  describe 'ursm' do
    subject { Rubyist.make_unsaved(:name => 'ursm') }
    it { should be_valid }
    its(:to_param) { should == 'ursm' }
  end

  describe 'reserved name' do
    %w(new).each do |reserved|
      subject { Rubyist.make_unsaved(:name => reserved).tap(&:valid?) }
      its(:errors) { should be_invalid(:name) }
    end
  end
end
