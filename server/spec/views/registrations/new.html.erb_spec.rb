require 'spec_helper'

describe "registrations/new" do
  before(:each) do
    assign(:registration, stub_model(Registration,
      :organisation => "MyString",
      :registration_number => "MyString",
      :state => "MyString",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new registration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", registrations_path, "post" do
      assert_select "input#registration_organisation[name=?]", "registration[organisation]"
      assert_select "input#registration_registration_number[name=?]", "registration[registration_number]"
      assert_select "input#registration_state[name=?]", "registration[state]"
      assert_select "input#registration_country[name=?]", "registration[country]"
    end
  end
end
