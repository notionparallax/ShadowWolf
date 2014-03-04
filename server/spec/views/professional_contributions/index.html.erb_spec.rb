require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:professional_contributions, [
      stub_model(ProfessionalContribution,
        :activity => "Activity",
        :description => "MyText",
        :url => "Url",
        :date => "Date"
      ),
      stub_model(ProfessionalContribution,
        :activity => "Activity",
        :description => "MyText",
        :url => "Url",
        :date => "Date"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Activity".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
  end
end
