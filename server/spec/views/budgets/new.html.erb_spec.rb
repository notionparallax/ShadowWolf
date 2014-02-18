require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(Budget,
      :initial_phase_value_total => "",
      :final_phase_value_total => "",
      :initial_phase_fee_total => "",
      :final_phase_fee_total => "",
      :construction_initial => "",
      :construction_final => "",
      :comments => "MyText",
      :fee_type => "MyString"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", budgets_path, "post" do
      assert_select "input#config_project_initial_phase_value_total[name=?]", "config_project[initial_phase_value_total]"
      assert_select "input#config_project_final_phase_value_total[name=?]", "config_project[final_phase_value_total]"
      assert_select "input#config_project_initial_phase_fee_total[name=?]", "config_project[initial_phase_fee_total]"
      assert_select "input#config_project_final_phase_fee_total[name=?]", "config_project[final_phase_fee_total]"
      assert_select "input#config_project_construction_initial[name=?]", "config_project[construction_initial]"
      assert_select "input#config_project_construction_final[name=?]", "config_project[construction_final]"
      assert_select "textarea#config_project_comments[name=?]", "config_project[comments]"
      assert_select "input#config_project_fee_type[name=?]", "config_project[fee_type]"
    end
  end
end
