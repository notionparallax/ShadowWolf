require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(PersonContact,
      :personal_email => "MyString",
      :personal_phone => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_contacts_path, "post" do
      assert_select "input#config_model_personal_email[name=?]", "config_model[personal_email]"
      assert_select "input#config_model_personal_phone[name=?]", "config_model[personal_phone]"
    end
  end
end
