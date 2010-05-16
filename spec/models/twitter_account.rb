require 'spec_helper'

describe TwitterAccount do
  before do
    @account = TwitterAccount.new(1234)

    @attrs = {
      :screen_name       => 'ursm',
      :profile_image_url => 'http://example.com/ursm.jpg'
    }.with_indifferent_access
  end

  shared_examples_for 'ユーザ情報を取得できる' do
    subject { @account }
    its(:screen_name) { should == 'ursm' }
    its(:profile_image_url) { should == 'http://example.com/ursm.jpg' }
  end

  context 'キャッシュされてない' do
    before do
      mock(@account.twitter).user(1234) { @attrs }
    end

    it_should_behave_like 'ユーザ情報を取得できる'
  end

  context 'キャッシュされてる' do
    before do
      redis['twitter/1234'] = @attrs.to_json
      dont_allow(@account.twitter).user
    end

    it_should_behave_like 'ユーザ情報を取得できる'
  end
end
