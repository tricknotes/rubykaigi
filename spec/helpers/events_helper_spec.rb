require 'spec_helper'

describe EventsHelper do
  describe '#nicovideo_link' do
    before do
      stub(helper).render do |args|
        args[:locals][:item_id].should match(/^sm[0-9]+$/)
        '_nico_'
      end
    end
    it { helper.nicovideo_link('sm00000001').should == '_nico_' }
    it { helper.nicovideo_link('sm00000001,sm0000002').should == '_nico__nico_' }
    it { helper.nicovideo_link(nil).should == '' }
    it { helper.nicovideo_link('').should == '' }
  end
end
