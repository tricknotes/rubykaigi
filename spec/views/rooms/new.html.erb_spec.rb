require 'spec_helper'

describe "/rooms/new.html.erb" do
  include RoomsHelper

  before(:each) do
    assigns[:room] = stub_model(Room,
      :new_record? => true,
      :name_en => "value for name_en",
      :name_ja => "value for name_ja",
      :floor_en => "value for floor_en",
      :floor_ja => "value for floor_ja",
      :sort_order => 1
    )
  end

  it "renders new room form" do
    render

    response.should have_tag("form[action=?][method=post]", rooms_path) do
      with_tag("input#room_name_en[name=?]", "room[name_en]")
      with_tag("input#room_name_ja[name=?]", "room[name_ja]")
      with_tag("input#room_floor_en[name=?]", "room[floor_en]")
      with_tag("input#room_floor_ja[name=?]", "room[floor_ja]")
      with_tag("input#room_sort_order[name=?]", "room[sort_order]")
    end
  end
end
