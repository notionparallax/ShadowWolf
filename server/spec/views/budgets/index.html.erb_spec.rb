require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:budgets, [
      stub_model(Budget,
        :initial_phase_value_total => 1.5,
        :final_phase_value_total => 1.5,
        :initial_phase_fee_total => 1.5,
        :final_phase_fee_total => 1.5,
        :construction_initial => 1.5,
        :construction_final => 1.5,
        :comments => "MyText",
        :fee_type => "Fee Type"
      ),
      stub_model(Budget,
        :initial_phase_value_total => 1.5,
        :final_phase_value_total => 1.5,
        :initial_phase_fee_total => 1.5,
        :final_phase_fee_total => 1.5,
        :construction_initial => 1.5,
        :construction_final => 1.5,
        :comments => "MyText",
        :fee_type => "Fee Type"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Fee Type".to_s, :count => 2
  end
end
