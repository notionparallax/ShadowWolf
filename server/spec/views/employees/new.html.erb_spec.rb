require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Employee,
      :login => "MyString",
      :position => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employees_path, "post" do
      assert_select "input#config_model_login[name=?]", "config_model[login]"
      assert_select "input#config_model_position[name=?]", "config_model[position]"
    end
  end
end
