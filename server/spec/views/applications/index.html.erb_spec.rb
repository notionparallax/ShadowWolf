require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:applications, [
      stub_model(Application,
        :covering_letter => "Covering Letter",
        :portfolio => "Portfolio",
        :assessment => "MyText",
        :future_consideration => false,
        :skills_and_keywords => "MyText"
      ),
      stub_model(Application,
        :covering_letter => "Covering Letter",
        :portfolio => "Portfolio",
        :assessment => "MyText",
        :future_consideration => false,
        :skills_and_keywords => "MyText"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Covering Letter".to_s, :count => 2
    assert_select "tr>td", :text => "Portfolio".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
