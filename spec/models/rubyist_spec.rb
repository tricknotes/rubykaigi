require 'spec_helper'

describe Rubyist do
  describe 'ursm' do
    subject { Rubyist.make_unsaved(:name => 'ursm') }
    it { should be_valid }
    its(:to_param) { should == 'ursm' }
  end

  %w(new edit).each do |reserved|
    context "reserved name: #{reserved}" do
      subject { Rubyist.make_unsaved(:name => reserved).tap(&:valid?) }
      its(:errors) { should be_invalid(:name) }
    end
  end

  context 'two rubyists' do
    before do
       @ursm = Rubyist.make(:name => 'ursm', :twitter_user_id => 1234)
       @kakutani = Rubyist.make(:name => 'kakutani', :twitter_user_id => 3456)
    end

    it { Rubyist.should have(2).records }
    it { @ursm.should be_valid }
    it { @kakutani.should be_valid }
  end
end
