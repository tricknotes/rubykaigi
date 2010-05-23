require 'spec_helper'

describe "/time_slits/edit.html.erb" do
  include TimeSlitsHelper

  before(:each) do
    assigns[:time_slit] = @time_slit = stub_model(TimeSlit,
      :new_record? => false
    )
  end

  it "renders the edit time_slit form" do
    render

    response.should have_tag("form[action=#{time_slit_path(@time_slit)}][method=post]") do
    end
  end
end
