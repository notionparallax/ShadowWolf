require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:legacies, [
      stub_model(Legacy,
        :one_line_grab => "MyText",
        :description_project_sheet => "MyText",
        :description_awards_style => "MyText",
        :innovation_client_style => "MyText",
        :interesting_things => "MyText",
        :brief_elements => "MyText",
        :security_level => "Security Level"
      ),
      stub_model(Legacy,
        :one_line_grab => "MyText",
        :description_project_sheet => "MyText",
        :description_awards_style => "MyText",
        :innovation_client_style => "MyText",
        :interesting_things => "MyText",
        :brief_elements => "MyText",
        :security_level => "Security Level"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Security Level".to_s, :count => 2
  end
end
