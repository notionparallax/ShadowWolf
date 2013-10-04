require 'spec_helper'

describe "mobiles/index" do
  before(:each) do
    assign(:mobiles, [
      stub_model(Mobile,
        :number => "Number",
        :is_bvn => false,
        :distribute => false
      ),
      stub_model(Mobile,
        :number => "Number",
        :is_bvn => false,
        :distribute => false
      )
    ])
  end

  it "renders a list of mobiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
