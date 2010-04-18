require 'spec_helper'

describe RubyistsController do
  describe 'POST /create' do
    context 'with Twitter credentials' do
      before do
        @rubyist = Rubyist.new
        mock(Rubyist).new('name' => 'ursm', 'twitter_user_id' => 4567) { @rubyist }

        session[:credentials] = {:twitter_user_id => 4567}
      end

      context 'saved' do
        before do
          mock(@rubyist).save { true }
          mock(controller).user = @rubyist

          post :create, :rubyist => {:name => 'ursm'}
        end

        it { response.should redirect_to(root_path) }
        it { session[:credentials].should be_nil }
      end

      context 'failed' do
        before do
          mock(@rubyist).save { false }
          dont_allow(controller).user = anything

          post :create, :rubyist => {:name => 'ursm'}
        end

        it { response.should be_success }
        it { response.should render_template(:new) }
        it { session[:credentials][:twitter_user_id].should == 4567 }
      end
    end

    context 'with OpenID credentials' do
      before do
        @rubyist = Rubyist.new
        mock(Rubyist).new('name' => 'ursm', 'identity_url' => 'http://ursm.jp/') { @rubyist }

        session[:credentials] = {:identity_url => 'http://ursm.jp/'}
      end

      context 'saved' do
        before do
          mock(@rubyist).save { true }
          mock(controller).user = @rubyist

          post :create, :rubyist => {:name => 'ursm'}
        end

        it { response.should redirect_to(root_path) }
        it { session[:credentials].should be_nil }
      end

      context 'failed' do
        before do
          mock(@rubyist).save { false }
          dont_allow(controller).user = anything

          post :create, :rubyist => {:name => 'ursm'}
        end

        it { response.should be_success }
        it { response.should render_template(:new) }
        it { session[:credentials][:identity_url].should == 'http://ursm.jp/' }
      end
    end

    context 'no credentials' do
      before do
        post :create, :rubyist => {:name => 'ursm'}
      end

      it { response.should redirect_to(new_sessions_path) }
    end
  end
end
