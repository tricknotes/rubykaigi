require 'spec_helper'

describe "/rooms/edit.html.erb" do
  include RoomsHelper

  before(:each) do
    assigns[:room] = @room = stub_model(Room,
      :new_record? => false,
      :name_en => "value for name_en",
      :name_ja => "value for name_ja",
      :floor_en => "value for floor_en",
      :floor_ja => "value for floor_ja",
      :sort_order => 1
    )
  end

  it "renders the edit room form" do
    render

    response.should have_tag("form[action=#{room_path(@room)}][method=post]") do
      with_tag('input#room_name_en[name=?]', "room[name_en]")
      with_tag('input#room_name_ja[name=?]', "room[name_ja]")
      with_tag('input#room_floor_en[name=?]', "room[floor_en]")
      with_tag('input#room_floor_ja[name=?]', "room[floor_ja]")
      with_tag('input#room_sort_order[name=?]', "room[sort_order]")
    end
  end
end
