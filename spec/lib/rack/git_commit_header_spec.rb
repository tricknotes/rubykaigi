require File.expand_path('../../../spec_helper', __FILE__)

describe Rack::GitCommitHeader do
  def headers
    Rack::GitCommitHeader.new(proc {|env| [200, {}, 'hello'] }).call(nil).second
  end

  context 'git returns valid revision' do
    before do
      @rev = ActiveSupport::SecureRandom.hex(20)
      mock.instance_of(Rack::GitCommitHeader).git_rev_parse_head { @rev }
    end

    describe 'headers' do
      specify { headers.should == {'X-Git-Commit' => @rev} }
    end
  end

  context 'git returns invalid revision' do
    before do
      mock.instance_of(Rack::GitCommitHeader).git_rev_parse_head { 'ho' }
    end

    describe 'headers' do
      specify { headers.should_not have_key('X-Git-Commit') }
    end
  end
end
