require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(Employee,
      :login => "MyString",
      :position => "MyString"
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "input#config_model_login[name=?]", "config_model[login]"
      assert_select "input#config_model_position[name=?]", "config_model[position]"
    end
  end
end