require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(PersonContact,
      :personal_email => "MyString",
      :personal_phone => "MyString"
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "input#config_model_personal_email[name=?]", "config_model[personal_email]"
      assert_select "input#config_model_personal_phone[name=?]", "config_model[personal_phone]"
    end
  end
end
