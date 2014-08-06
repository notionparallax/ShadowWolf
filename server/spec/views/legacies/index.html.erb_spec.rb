require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:legacies, [
      stub_model(Legacy,
        :one_line_grab => "MyText",
        :dirty_pictures => "MyText",
        :dirty_testimonial => "MyText",
        :description_project_sheet => "MyText",
        :description_200_500_words => "MyText",
        :description_awards_style => "MyText",
        :dirty_awards => "Dirty Awards",
        :innovation_client_style => "MyText",
        :innovation_value_add => "MyText",
        :interesting_things => "MyText",
        :brief_elements => "MyText",
        :security_level => "Security Level"
      ),
      stub_model(Legacy,
        :one_line_grab => "MyText",
        :dirty_pictures => "MyText",
        :dirty_testimonial => "MyText",
        :description_project_sheet => "MyText",
        :description_200_500_words => "MyText",
        :description_awards_style => "MyText",
        :dirty_awards => "Dirty Awards",
        :innovation_client_style => "MyText",
        :innovation_value_add => "MyText",
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
    assert_select "tr>td", :text => "Dirty Awards".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Security Level".to_s, :count => 2
  end
end
