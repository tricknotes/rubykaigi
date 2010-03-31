require File.expand_path('../../../spec_helper', __FILE__)

describe Rack::GitCommitHeader do
  def headers
    Rack::GitCommitHeader.new(proc {|env| [200, {}, 'hello'] }).call(nil).second
  end

  context 'when git returns valid revision' do
    before do
      @rev = ActiveSupport::SecureRandom.hex(20)
      mock.instance_of(Rack::GitCommitHeader).git_rev_parse_head { @rev }
    end

    subject { headers }
    it { should == {'X-Git-Commit' => @rev} }
  end

  context 'when git returns invalid revision' do
    before do
      mock.instance_of(Rack::GitCommitHeader).git_rev_parse_head { 'ho' }
    end

    subject { headers }
    it { should_not have_key('X-Git-Commit') }
  end
end
