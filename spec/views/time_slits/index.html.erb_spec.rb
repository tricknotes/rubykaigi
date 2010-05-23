require 'spec_helper'

describe "/time_slits/index.html.erb" do
  include TimeSlitsHelper

  before(:each) do
    assigns[:time_slits] = [
      stub_model(TimeSlit),
      stub_model(TimeSlit)
    ]
  end

  it "renders a list of time_slits" do
    render
  end
end
