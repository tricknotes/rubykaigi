require 'spec_helper'

describe Rubyist do
  describe 'ursm' do
    subject { Rubyist.make_unsaved(:name => 'ursm') }
    it { should be_valid }
    its(:to_param) { should == 'ursm' }
  end

  %w(new edit).each do |reserved|
    context "name is #{reserved}" do
      subject { Rubyist.make_unsaved(:name => reserved).tap(&:valid?) }
      its(:errors) { should be_invalid(:name) }
    end
  end
end
