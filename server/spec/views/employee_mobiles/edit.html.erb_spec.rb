require 'spec_helper'

describe "employee_mobiles/edit" do
  before(:each) do
    @employee_mobile = assign(:employee_mobile, stub_model(EmployeeMobile,
      :number => "MyString",
      :is_work => false,
      :distribute => false
    ))
  end

  it "renders the edit employee_mobile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employee_mobile_path(@employee_mobile), "post" do
      assert_select "input#employee_mobile_number[name=?]", "employee_mobile[number]"
      assert_select "input#employee_mobile_is_work[name=?]", "employee_mobile[is_work]"
      assert_select "input#employee_mobile_distribute[name=?]", "employee_mobile[distribute]"
    end
  end
end
