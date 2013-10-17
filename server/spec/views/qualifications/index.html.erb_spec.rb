require 'spec_helper'

describe "qualifications/index" do
  before(:each) do
    assign(:qualifications, [
      stub_model(Qualification,
        :name => "Name",
        :level => "Level",
        :institution => "Institution",
        :first_year => 1,
        :last_year => 2
      ),
      stub_model(Qualification,
        :name => "Name",
        :level => "Level",
        :institution => "Institution",
        :first_year => 1,
        :last_year => 2
      )
    ])
  end

  it "renders a list of qualifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Level".to_s, :count => 2
    assert_select "tr>td", :text => "Institution".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
