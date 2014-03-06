require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:event_participations, [
      stub_model(EventParticipation,
        :name => "Name",
        :url => "Url"
      ),
      stub_model(EventParticipation,
        :name => "Name",
        :url => "Url"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
