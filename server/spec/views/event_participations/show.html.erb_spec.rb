require 'spec_helper'

describe "event_participations/show" do
  before(:each) do
    @event_participation = assign(:event_participation, stub_model(EventParticipation,
      :name => "Name",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
  end
end
