require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(EmployeeContact,
      :extension => "MyString",
      :studio => "MyString",
      :work_email => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employee_contacts_path, "post" do
      assert_select "input#config_person_extension[name=?]", "config_person[extension]"
      assert_select "input#config_person_studio[name=?]", "config_person[studio]"
      assert_select "input#config_person_work_email[name=?]", "config_person[work_email]"
    end
  end
end
