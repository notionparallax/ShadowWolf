require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Registration,
      :organisation => "MyString",
      :registration_number => "MyString",
      :state => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_organisation[name=?]", "config_person[organisation]"
      assert_select "input#config_person_registration_number[name=?]", "config_person[registration_number]"
      assert_select "input#config_person_state[name=?]", "config_person[state]"
      assert_select "input#config_person_country[name=?]", "config_person[country]"
    end
  end
end
