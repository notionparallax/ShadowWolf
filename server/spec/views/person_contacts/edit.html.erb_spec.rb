require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(PersonContact,
      :personal_email => "MyString",
      :personal_phone => "MyString"
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_personal_email[name=?]", "config_person[personal_email]"
      assert_select "input#config_person_personal_phone[name=?]", "config_person[personal_phone]"
    end
  end
end
