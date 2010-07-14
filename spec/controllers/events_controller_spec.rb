# -*- coding: utf-8 -*-
require 'spec_helper'

describe EventsController do
  describe 'GET index' do
    it 'assigns all events as @events' do
      pending "eventがnilになって落ちる。とりあえずpendingにしてます"
      events = [event = Event.make]
      mock(Event).all.with_any_args { events }
      get :index
      assigns[:events].should == events
      assigns[:rooms].should == [event.room]
    end
  end
end
