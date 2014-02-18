require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Budget,
      :initial_phase_value_total => "",
      :final_phase_value_total => "",
      :initial_phase_fee_total => "",
      :final_phase_fee_total => "",
      :construction_initial => "",
      :construction_final => "",
      :comments => "MyText",
      :fee_type => "Fee Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/Fee Type/)
  end
end
