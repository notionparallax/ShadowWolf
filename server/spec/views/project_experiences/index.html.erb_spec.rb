require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:project_experiences, [
      stub_model(ProjectExperience,
        :name => "Name",
        :firm => "Firm",
        :role => "Role",
        :stage => "Stage",
        :url => "Url"
      ),
      stub_model(ProjectExperience,
        :name => "Name",
        :firm => "Firm",
        :role => "Role",
        :stage => "Stage",
        :url => "Url"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Firm".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Stage".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
