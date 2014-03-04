require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:frequent_flier_programs, [
      stub_model(FrequentFlierProgram,
        :name => "Name",
        :number => "Number"
      ),
      stub_model(FrequentFlierProgram,
        :name => "Name",
        :number => "Number"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
  end
end
