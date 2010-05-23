require 'spec_helper'

describe "/rooms/index.html.erb" do
  include RoomsHelper

  before(:each) do
    assigns[:rooms] = [
      stub_model(Room,
        :name_en => "value for name_en",
        :name_ja => "value for name_ja",
        :floor_en => "value for floor_en",
        :floor_ja => "value for floor_ja",
        :sort_order => 1
      ),
      stub_model(Room,
        :name_en => "value for name_en",
        :name_ja => "value for name_ja",
        :floor_en => "value for floor_en",
        :floor_ja => "value for floor_ja",
        :sort_order => 1
      )
    ]
  end

  it "renders a list of rooms" do
    render
    response.should have_tag("tr>td", "value for name_en".to_s, 2)
    response.should have_tag("tr>td", "value for name_ja".to_s, 2)
    response.should have_tag("tr>td", "value for floor_en".to_s, 2)
    response.should have_tag("tr>td", "value for floor_ja".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
