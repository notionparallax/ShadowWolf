require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:buildings, [
      stub_model(Building,
        :description => "MyText",
        :attribution => "Attribution",
        :BCA_classification => "Bca Classification",
        :project_catagories => "",
        :project_sub-catagories => ""
      ),
      stub_model(Building,
        :description => "MyText",
        :attribution => "Attribution",
        :BCA_classification => "Bca Classification",
        :project_catagories => "",
        :project_sub-catagories => ""
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Attribution".to_s, :count => 2
    assert_select "tr>td", :text => "Bca Classification".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
