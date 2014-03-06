require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:project_sources, [
      stub_model(ProjectSource,
        :competition_win => false,
        :competition_URL => "Competition Url"
      ),
      stub_model(ProjectSource,
        :competition_win => false,
        :competition_URL => "Competition Url"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Competition Url".to_s, :count => 2
  end
end
