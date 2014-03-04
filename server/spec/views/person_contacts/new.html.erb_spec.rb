require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(PersonContact,
      :personal_email => "MyString",
      :personal_phone => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_contacts_path, "post" do
      assert_select "input#config_person_personal_email[name=?]", "config_person[personal_email]"
      assert_select "input#config_person_personal_phone[name=?]", "config_person[personal_phone]"
    end
  end
end
