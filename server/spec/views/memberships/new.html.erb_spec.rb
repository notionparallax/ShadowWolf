require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(Membership,
      :organisation => "MyString",
      :membership_number => "MyString",
      :state => "MyString",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", memberships_path, "post" do
      assert_select "input#config_person_organisation[name=?]", "config_person[organisation]"
      assert_select "input#config_person_membership_number[name=?]", "config_person[membership_number]"
      assert_select "input#config_person_state[name=?]", "config_person[state]"
      assert_select "input#config_person_country[name=?]", "config_person[country]"
    end
  end
end
