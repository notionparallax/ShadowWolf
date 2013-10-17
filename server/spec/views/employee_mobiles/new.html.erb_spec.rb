require 'spec_helper'

describe "employee_mobiles/new" do
  before(:each) do
    assign(:employee_mobile, stub_model(EmployeeMobile,
      :number => "MyString",
      :is_work => false,
      :distribute => false
    ).as_new_record)
  end

  it "renders new employee_mobile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employee_mobiles_path, "post" do
      assert_select "input#employee_mobile_number[name=?]", "employee_mobile[number]"
      assert_select "input#employee_mobile_is_work[name=?]", "employee_mobile[is_work]"
      assert_select "input#employee_mobile_distribute[name=?]", "employee_mobile[distribute]"
    end
  end
end
