require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(SecurityClearance,
      :issuing_body => "MyString",
      :level => "MyString"
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "input#config_model_issuing_body[name=?]", "config_model[issuing_body]"
      assert_select "input#config_model_level[name=?]", "config_model[level]"
    end
  end
end
