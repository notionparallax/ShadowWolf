require 'spec_helper'

describe "employee_contacts/new" do
  before(:each) do
    assign(:employee_contact, stub_model(EmployeeContact,
      :extension => "MyString",
      :studio => "MyString",
      :work_email => "MyString"
    ).as_new_record)
  end

  it "renders new employee_contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employee_contacts_path, "post" do
      assert_select "input#employee_contact_extension[name=?]", "employee_contact[extension]"
      assert_select "input#employee_contact_studio[name=?]", "employee_contact[studio]"
      assert_select "input#employee_contact_work_email[name=?]", "employee_contact[work_email]"
    end
  end
end
