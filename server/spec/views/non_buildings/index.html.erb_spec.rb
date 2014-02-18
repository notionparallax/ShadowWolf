require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:non_buildings, [
      stub_model(NonBuilding,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(NonBuilding,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
