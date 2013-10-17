require 'spec_helper'

describe "person_contacts/new" do
  before(:each) do
    assign(:person_contact, stub_model(PersonContact,
      :personal_email => "MyString",
      :personal_phone => "MyString"
    ).as_new_record)
  end

  it "renders new person_contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_contacts_path, "post" do
      assert_select "input#person_contact_personal_email[name=?]", "person_contact[personal_email]"
      assert_select "input#person_contact_personal_phone[name=?]", "person_contact[personal_phone]"
    end
  end
end
