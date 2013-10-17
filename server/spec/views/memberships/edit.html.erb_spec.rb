require 'spec_helper'

describe "memberships/edit" do
  before(:each) do
    @membership = assign(:membership, stub_model(Membership,
      :organisation => "MyString",
      :membership_number => "MyString",
      :state => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", membership_path(@membership), "post" do
      assert_select "input#membership_organisation[name=?]", "membership[organisation]"
      assert_select "input#membership_membership_number[name=?]", "membership[membership_number]"
      assert_select "input#membership_state[name=?]", "membership[state]"
      assert_select "input#membership_country[name=?]", "membership[country]"
    end
  end
end
