require 'spec_helper'

describe HeadlineEntry do
  describe '.crawl' do
    before do
      @exists = HeadlineEntry.make(:link => 'http://rubykaigi.tdiary.net/20100225.html#p01')

      mock(HeadlineEntry).open('http://example.com/index.rdf') {
        open('spec/fixtures/files/rubykaigi_nikki.rdf')
      }

      HeadlineEntry.crawl('http://example.com/index.rdf', 'rubykaigi2010')
    end

    it { HeadlineEntry.should have(7).records }
    it { HeadlineEntry.recent('ja', 7).should have(6).records }
    it { HeadlineEntry.recent('en', 7).should have(1).record }

    describe 'lang:ja' do
      subject { HeadlineEntry.find_by_link('http://rubykaigi.tdiary.net/20100225.html#p02') }
      its(:title) { should == '日本Ruby会議2010の趣意書が公開されました' }
      its(:time) { should == Time.parse('2010-02-25T08:58:34+09:00') }
      its(:content) { should =~ %r(^<h3>日本Ruby会議2010の趣意書が公開されました</h3>) }
      its(:language) { should == 'ja' }
    end

    describe 'lang:en' do
      subject { HeadlineEntry.find_by_link('http://rubykaigi.tdiary.net/20100412.html#p01') }
      its(:title) { should == 'RubyKaigi 2010 is open for talk and sub-event organizers, conference sponsors and illustrations!' }
      its(:language) { should == 'en' }
    end

    describe 'exists' do
      subject { HeadlineEntry.find_by_link(@exists.link) }
      its(:title) { should == 'Ruby会議2010がそろそろ動き出したようです' }
    end
  end
end
