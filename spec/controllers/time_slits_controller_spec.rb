require 'spec_helper'

describe TimeSlitsController do

  def mock_time_slit(stubs={})
    @mock_time_slit ||= mock_model(TimeSlit, stubs)
  end

  describe "GET index" do
    it "assigns all time_slits as @time_slits" do
      TimeSlit.stub(:find).with(:all).and_return([mock_time_slit])
      get :index
      assigns[:time_slits].should == [mock_time_slit]
    end
  end

  describe "GET show" do
    it "assigns the requested time_slit as @time_slit" do
      TimeSlit.stub(:find).with("37").and_return(mock_time_slit)
      get :show, :id => "37"
      assigns[:time_slit].should equal(mock_time_slit)
    end
  end

  describe "GET new" do
    it "assigns a new time_slit as @time_slit" do
      TimeSlit.stub(:new).and_return(mock_time_slit)
      get :new
      assigns[:time_slit].should equal(mock_time_slit)
    end
  end

  describe "GET edit" do
    it "assigns the requested time_slit as @time_slit" do
      TimeSlit.stub(:find).with("37").and_return(mock_time_slit)
      get :edit, :id => "37"
      assigns[:time_slit].should equal(mock_time_slit)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created time_slit as @time_slit" do
        TimeSlit.stub(:new).with({'these' => 'params'}).and_return(mock_time_slit(:save => true))
        post :create, :time_slit => {:these => 'params'}
        assigns[:time_slit].should equal(mock_time_slit)
      end

      it "redirects to the created time_slit" do
        TimeSlit.stub(:new).and_return(mock_time_slit(:save => true))
        post :create, :time_slit => {}
        response.should redirect_to(time_slit_url(mock_time_slit))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved time_slit as @time_slit" do
        TimeSlit.stub(:new).with({'these' => 'params'}).and_return(mock_time_slit(:save => false))
        post :create, :time_slit => {:these => 'params'}
        assigns[:time_slit].should equal(mock_time_slit)
      end

      it "re-renders the 'new' template" do
        TimeSlit.stub(:new).and_return(mock_time_slit(:save => false))
        post :create, :time_slit => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested time_slit" do
        TimeSlit.should_receive(:find).with("37").and_return(mock_time_slit)
        mock_time_slit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :time_slit => {:these => 'params'}
      end

      it "assigns the requested time_slit as @time_slit" do
        TimeSlit.stub(:find).and_return(mock_time_slit(:update_attributes => true))
        put :update, :id => "1"
        assigns[:time_slit].should equal(mock_time_slit)
      end

      it "redirects to the time_slit" do
        TimeSlit.stub(:find).and_return(mock_time_slit(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(time_slit_url(mock_time_slit))
      end
    end

    describe "with invalid params" do
      it "updates the requested time_slit" do
        TimeSlit.should_receive(:find).with("37").and_return(mock_time_slit)
        mock_time_slit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :time_slit => {:these => 'params'}
      end

      it "assigns the time_slit as @time_slit" do
        TimeSlit.stub(:find).and_return(mock_time_slit(:update_attributes => false))
        put :update, :id => "1"
        assigns[:time_slit].should equal(mock_time_slit)
      end

      it "re-renders the 'edit' template" do
        TimeSlit.stub(:find).and_return(mock_time_slit(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested time_slit" do
      TimeSlit.should_receive(:find).with("37").and_return(mock_time_slit)
      mock_time_slit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the time_slits list" do
      TimeSlit.stub(:find).and_return(mock_time_slit(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(time_slits_url)
    end
  end

end
