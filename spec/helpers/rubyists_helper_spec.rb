require 'spec_helper'

describe RubyistsHelper do
  describe 'rubyist_name' do
    context 'Rubyist has only username' do
      before do
        @ursm = Rubyist.make(:username => 'ursm')
        @kakutani = Rubyist.make(:username => 'kakutani', :full_name => '')
      end

      specify { helper.rubyist_name(@ursm).should == 'ursm' }
      specify { helper.rubyist_name(@kakutani).should == 'kakutani' }
    end

    context 'Rubyist has both username and full name' do
      before do
        @ursm = Rubyist.make(:username => 'ursm', :full_name => 'Keita Urashima')
      end

      specify { helper.rubyist_name(@ursm).should == 'ursm (Keita Urashima)' }
    end
  end
end
