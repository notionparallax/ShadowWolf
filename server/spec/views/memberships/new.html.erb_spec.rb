require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Membership,
      :organisation => "MyString",
      :membership_number => "MyString",
      :state => "MyString",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", memberships_path, "post" do
      assert_select "input#config_model_organisation[name=?]", "config_model[organisation]"
      assert_select "input#config_model_membership_number[name=?]", "config_model[membership_number]"
      assert_select "input#config_model_state[name=?]", "config_model[state]"
      assert_select "input#config_model_country[name=?]", "config_model[country]"
    end
  end
end
