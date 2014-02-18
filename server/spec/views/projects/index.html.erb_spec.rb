require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :project_number => "Project Number"
      ),
      stub_model(Project,
        :project_number => "Project Number"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Project Number".to_s, :count => 2
  end
end
