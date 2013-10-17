require 'spec_helper'

describe "event_participations/edit" do
  before(:each) do
    @event_participation = assign(:event_participation, stub_model(EventParticipation,
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit event_participation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_participation_path(@event_participation), "post" do
      assert_select "input#event_participation_name[name=?]", "event_participation[name]"
      assert_select "input#event_participation_url[name=?]", "event_participation[url]"
    end
  end
end
