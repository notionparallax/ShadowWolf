require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:dimension_groups, [
      stub_model(DimensionGroup,
        :dirty_size => "Dirty Size"
      ),
      stub_model(DimensionGroup,
        :dirty_size => "Dirty Size"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dirty Size".to_s, :count => 2
  end
end
