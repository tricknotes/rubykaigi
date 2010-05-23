require 'spec_helper'

describe "/events/new.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:event] = stub_model(Event,
      :new_record? => true,
      :title_en => "value for title_en",
      :title_ja => "value for title_ja",
      :abstract_en => "value for abstract_en",
      :abstract_ja => "value for abstract_ja",
      :detail_en => "value for detail_en",
      :detail_ja => "value for detail_ja",
      :additional_info => "value for additional_info",
      :lang => "value for lang",
      :required_equipment => "value for required_equipment",
      :parent_event_id => 1,
      :break => false
    )
  end

  it "renders new event form" do
    render

    response.should have_tag("form[action=?][method=post]", events_path) do
      with_tag("input#event_title_en[name=?]", "event[title_en]")
      with_tag("input#event_title_ja[name=?]", "event[title_ja]")
      with_tag("input#event_abstract_en[name=?]", "event[abstract_en]")
      with_tag("input#event_abstract_ja[name=?]", "event[abstract_ja]")
      with_tag("input#event_detail_en[name=?]", "event[detail_en]")
      with_tag("input#event_detail_ja[name=?]", "event[detail_ja]")
      with_tag("input#event_additional_info[name=?]", "event[additional_info]")
      with_tag("input#event_lang[name=?]", "event[lang]")
      with_tag("input#event_required_equipment[name=?]", "event[required_equipment]")
      with_tag("input#event_parent_event_id[name=?]", "event[parent_event_id]")
      with_tag("input#event_break[name=?]", "event[break]")
    end
  end
end
