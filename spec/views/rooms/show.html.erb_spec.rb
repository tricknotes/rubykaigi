require 'spec_helper'

describe "/rooms/show.html.erb" do
  include RoomsHelper
  before(:each) do
    assigns[:room] = @room = stub_model(Room,
      :name_en => "value for name_en",
      :name_ja => "value for name_ja",
      :floor_en => "value for floor_en",
      :floor_ja => "value for floor_ja",
      :sort_order => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name_en/)
    response.should have_text(/value\ for\ name_ja/)
    response.should have_text(/value\ for\ floor_en/)
    response.should have_text(/value\ for\ floor_ja/)
    response.should have_text(/1/)
  end
end
