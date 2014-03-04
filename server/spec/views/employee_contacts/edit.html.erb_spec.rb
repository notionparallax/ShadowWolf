require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(EmployeeContact,
      :extension => "MyString",
      :studio => "MyString",
      :work_email => "MyString"
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_extension[name=?]", "config_person[extension]"
      assert_select "input#config_person_studio[name=?]", "config_person[studio]"
      assert_select "input#config_person_work_email[name=?]", "config_person[work_email]"
    end
  end
end
