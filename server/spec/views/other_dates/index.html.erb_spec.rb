require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:other_dates, [
      stub_model(OtherDate,
        :description => "Description"
      ),
      stub_model(OtherDate,
        :description => "Description"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
