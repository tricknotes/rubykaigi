require 'spec_helper'

describe RubyistsController do
  describe 'POST /create' do
    before do
      @rubyist = Rubyist.new
      mock(Rubyist).new('name' => 'ursm', 'twitter_user_id' => 4567) { @rubyist }

      session[:twitter_user_id] = 4567
    end

    context 'saved' do
      before do
        mock(@rubyist).save { true }
        mock(controller).user = @rubyist

        post :create, :rubyist => {:name => 'ursm'}
      end

      it { response.should redirect_to(root_path) }
      it { session[:twitter_user_id].should be_nil }
    end

    context 'failed' do
      before do
        mock(@rubyist).save { false }
        dont_allow(controller).user = anything

        post :create, :rubyist => {:name => 'ursm'}
      end

      it { response.should be_success }
      it { response.should render_template(:new) }
      it { session[:twitter_user_id].should == 4567 }
    end
  end
end
