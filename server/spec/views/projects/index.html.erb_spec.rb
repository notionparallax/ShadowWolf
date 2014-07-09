require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :project_number => "Project Number",
        :img => "Img",
        :value => "Value"
      ),
      stub_model(Project,
        :project_number => "Project Number",
        :img => "Img",
        :value => "Value"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Project Number".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
