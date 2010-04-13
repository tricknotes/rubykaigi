require 'spec_helper'

describe AccountController do
	describe '/unauthenticated' do
		context 'redirect back from Twitter with credentials' do
			before do
				stub(token = Object.new).params { {:user_id => 1234} }

				stub(controller).warden.stub!.env {
					{'warden.options' => {:oauth => {:twitter => {:access_token => token}}}}
				}

				get :unauthenticated
			end

			it { response.should redirect_to(:controller => :account, :action => :signup) }
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

			it { response.should redirect_to(root_path) }
			it { flash[:error].should == ['error 1', 'error 2'] }
		end
	end

	describe '/register' do
		before do
			@rubyist = Rubyist.new
			mock(Rubyist).new('name' => 'ursm', 'twitter_user_id' => 4567) { @rubyist }

			session[:twitter_user_id] = 4567
		end

		context 'saved' do
			before do
				mock(@rubyist).save { true }
				mock(controller).user = @rubyist

				post :register, :rubyist => {:name => 'ursm'}
			end

			it { response.should redirect_to(root_path) }
			it { session[:twitter_user_id].should be_nil }
		end

		context 'failed' do
			before do
				mock(@rubyist).save { false }
				dont_allow(controller).user = anything

				post :register, :rubyist => {:name => 'ursm'}
			end

			it { response.should be_success }
			it { response.should render_template(:signup) }
			it { session[:twitter_user_id].should == 4567 }
		end
	end
end
