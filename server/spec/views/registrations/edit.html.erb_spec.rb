require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(Registration,
      :organisation => "MyString",
      :registration_number => "MyString",
      :state => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "input#config_model_organisation[name=?]", "config_model[organisation]"
      assert_select "input#config_model_registration_number[name=?]", "config_model[registration_number]"
      assert_select "input#config_model_state[name=?]", "config_model[state]"
      assert_select "input#config_model_country[name=?]", "config_model[country]"
    end
  end
end
