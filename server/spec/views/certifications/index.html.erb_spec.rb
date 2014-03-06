require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:certifications, [
      stub_model(Certification,
        :name => "Name",
        :ranking => "Ranking",
        :awarding_body => "Awarding Body"
      ),
      stub_model(Certification,
        :name => "Name",
        :ranking => "Ranking",
        :awarding_body => "Awarding Body"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ranking".to_s, :count => 2
    assert_select "tr>td", :text => "Awarding Body".to_s, :count => 2
  end
end
