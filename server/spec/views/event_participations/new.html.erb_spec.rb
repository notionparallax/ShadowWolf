require 'spec_helper'

describe "event_participations/new" do
  before(:each) do
    assign(:event_participation, stub_model(EventParticipation,
      :name => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new event_participation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_participations_path, "post" do
      assert_select "input#event_participation_name[name=?]", "event_participation[name]"
      assert_select "input#event_participation_url[name=?]", "event_participation[url]"
    end
  end
end
