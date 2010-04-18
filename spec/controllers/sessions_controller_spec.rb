require 'spec_helper'

describe SessionsController do
  describe 'GET /unauthenticated' do
    context 'redirect back from Twitter with credentials' do
      before do
        stub(token = Object.new).params { {:user_id => 1234} }

        stub(controller).warden.stub!.env {
          {'warden.options' => {:oauth => {:twitter => {:access_token => token}}}}
        }

        get :unauthenticated
      end

      it { response.should redirect_to(new_rubyist_path) }
      it { session[:credentials][:twitter_user_id].should == 1234 }
    end

    context 'redirect back from OpenID provider with credentials' do
      before do
        stub(res = Object.new).identity_url { 'http://ursm.jp/' }

        stub(controller).warden.stub!.env {
          {'warden.options' => {:openid => {:response => res}}}
        }

        get :unauthenticated
      end

      it { response.should redirect_to(new_rubyist_path) }
      it { session[:credentials][:identity_url].should == 'http://ursm.jp/' }
    end

    context 'authentication failed' do
      before do
        stub(controller).warden.stub! {
          env { {'warden.options' => {}} }
          message { 'something' }
        }

        get :unauthenticated
      end

      it { response.should redirect_to(new_sessions_path) }
      it { flash[:error].should == 'something' }
    end
  end
end
