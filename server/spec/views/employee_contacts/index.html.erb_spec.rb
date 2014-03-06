require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:employee_contacts, [
      stub_model(EmployeeContact,
        :extension => "Extension",
        :studio => "Studio",
        :work_email => "Work Email"
      ),
      stub_model(EmployeeContact,
        :extension => "Extension",
        :studio => "Studio",
        :work_email => "Work Email"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Extension".to_s, :count => 2
    assert_select "tr>td", :text => "Studio".to_s, :count => 2
    assert_select "tr>td", :text => "Work Email".to_s, :count => 2
  end
end
