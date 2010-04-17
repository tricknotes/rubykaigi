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
      it { session[:twitter_user_id].should == 1234 }
    end

    context 'failed in authentication' do
      before do
        stub(controller).warden.stub! {
          env { {'warden.options' => {}} }
          errors.stub!.full_messages { ['error 1', 'error 2'] }
        }

        get :unauthenticated
      end

      it { response.should redirect_to(new_sessions_path) }
      it { flash[:errors].should == ['error 1', 'error 2'] }
    end
  end
end
