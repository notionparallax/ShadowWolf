require 'spec_helper'

describe "professional_contributions/index" do
  before(:each) do
    assign(:professional_contributions, [
      stub_model(ProfessionalContribution,
        :activity => "Activity",
        :description => "MyText",
        :url => "Url"
      ),
      stub_model(ProfessionalContribution,
        :activity => "Activity",
        :description => "MyText",
        :url => "Url"
      )
    ])
  end

  it "renders a list of professional_contributions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Activity".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
