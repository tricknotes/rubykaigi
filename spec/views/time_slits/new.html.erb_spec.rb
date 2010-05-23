require 'spec_helper'

describe "/time_slits/new.html.erb" do
  include TimeSlitsHelper

  before(:each) do
    assigns[:time_slit] = stub_model(TimeSlit,
      :new_record? => true
    )
  end

  it "renders new time_slit form" do
    render

    response.should have_tag("form[action=?][method=post]", time_slits_path) do
    end
  end
end
