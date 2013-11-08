require 'spec_helper'

describe "config/models/index" do
  before(:each) do
    assign(:personal_awards, [
      stub_model(PersonalAward,
        :name => "Name",
        :awarding_body => "Awarding Body",
        :description => "MyText",
        :url => "Url"
      ),
      stub_model(PersonalAward,
        :name => "Name",
        :awarding_body => "Awarding Body",
        :description => "MyText",
        :url => "Url"
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
  end
end
