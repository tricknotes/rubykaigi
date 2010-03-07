require 'test_helper'

class LightningTalkSubmissionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :redirect
    if lt_submission_open?
      assert_not_nil assigns(:lightning_talk_submissions)
    end
  end

  test "should create lightning_talk_submission" do
    assert_difference('LightningTalkSubmission.count') do
      post :create, {:lightning_talk_submission => {:name => "_name_", :email => "_email_", :title => "_title_", :abstract => "_abstract_"}, :locale => "en"}
    end

    assert_redirected_to :action => "thankyou"
  end

  test "should get thankyou" do
    get :thankyou
    assert_response :redirect
  end
  
  def lt_submission_open?
    Time.now <= Time.parse(configatron.lt_submission.close_at)
  end
end
