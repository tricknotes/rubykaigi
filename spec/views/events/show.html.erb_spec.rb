require 'spec_helper'

describe "/events/show.html.erb" do
  include EventsHelper
  before(:each) do
    assigns[:event] = @event = stub_model(Event,
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

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title_en/)
    response.should have_text(/value\ for\ title_ja/)
    response.should have_text(/value\ for\ abstract_en/)
    response.should have_text(/value\ for\ abstract_ja/)
    response.should have_text(/value\ for\ detail_en/)
    response.should have_text(/value\ for\ detail_ja/)
    response.should have_text(/value\ for\ additional_info/)
    response.should have_text(/value\ for\ lang/)
    response.should have_text(/value\ for\ required_equipment/)
    response.should have_text(/1/)
    response.should have_text(/false/)
  end
end
