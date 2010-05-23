require 'spec_helper'

describe "/time_slits/show.html.erb" do
  include TimeSlitsHelper
  before(:each) do
    assigns[:time_slit] = @time_slit = stub_model(TimeSlit)
  end

  it "renders attributes in <p>" do
    render
  end
end
