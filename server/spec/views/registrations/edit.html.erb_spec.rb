require 'spec_helper'

describe "registrations/edit" do
  before(:each) do
    @registration = assign(:registration, stub_model(Registration,
      :organisation => "MyString",
      :registration_number => "MyString",
      :state => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit registration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", registration_path(@registration), "post" do
      assert_select "input#registration_organisation[name=?]", "registration[organisation]"
      assert_select "input#registration_registration_number[name=?]", "registration[registration_number]"
      assert_select "input#registration_state[name=?]", "registration[state]"
      assert_select "input#registration_country[name=?]", "registration[country]"
    end
  end
end
