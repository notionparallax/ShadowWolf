require 'spec_helper'

describe "employee_contacts/show" do
  before(:each) do
    @employee_contact = assign(:employee_contact, stub_model(EmployeeContact,
      :extension => "Extension",
      :studio => "Studio",
      :work_email => "Work Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Extension/)
    rendered.should match(/Studio/)
    rendered.should match(/Work Email/)
  end
end
