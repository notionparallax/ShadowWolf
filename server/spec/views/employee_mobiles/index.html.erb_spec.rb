require 'spec_helper'

describe "employee_mobiles/index" do
  before(:each) do
    assign(:employee_mobiles, [
      stub_model(EmployeeMobile,
        :number => "Number",
        :is_work => false,
        :distribute => false
      ),
      stub_model(EmployeeMobile,
        :number => "Number",
        :is_work => false,
        :distribute => false
      )
    ])
  end

  it "renders a list of employee_mobiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
