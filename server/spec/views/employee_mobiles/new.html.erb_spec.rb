require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(EmployeeMobile,
      :number => "MyString",
      :is_work => false,
      :distribute => false
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employee_mobiles_path, "post" do
      assert_select "input#config_model_number[name=?]", "config_model[number]"
      assert_select "input#config_model_is_work[name=?]", "config_model[is_work]"
      assert_select "input#config_model_distribute[name=?]", "config_model[distribute]"
    end
  end
end
