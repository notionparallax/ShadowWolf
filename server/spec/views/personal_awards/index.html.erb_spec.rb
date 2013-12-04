require 'spec_helper'

describe "config/models/index" do
  before(:each) do
    assign(:personal_awards, [
      stub_model(PersonalAward,
        :name => "Name",
        :awarding_body => "Awarding Body",
        :description => "MyText",
        :url => "Url",
        :year_achieved => 1
      ),
      stub_model(PersonalAward,
        :name => "Name",
        :awarding_body => "Awarding Body",
        :description => "MyText",
        :url => "Url",
        :year_achieved => 1
      )
    ])
  end

  it "renders a list of config/models" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Awarding Body".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
