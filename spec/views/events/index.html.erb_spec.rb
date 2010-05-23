require 'spec_helper'

describe "/events/index.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:events] = [
      stub_model(Event,
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
      ),
      stub_model(Event,
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
    ]
  end

  it "renders a list of events" do
    render
    response.should have_tag("tr>td", "value for title_en".to_s, 2)
    response.should have_tag("tr>td", "value for title_ja".to_s, 2)
    response.should have_tag("tr>td", "value for abstract_en".to_s, 2)
    response.should have_tag("tr>td", "value for abstract_ja".to_s, 2)
    response.should have_tag("tr>td", "value for detail_en".to_s, 2)
    response.should have_tag("tr>td", "value for detail_ja".to_s, 2)
    response.should have_tag("tr>td", "value for additional_info".to_s, 2)
    response.should have_tag("tr>td", "value for lang".to_s, 2)
    response.should have_tag("tr>td", "value for required_equipment".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
