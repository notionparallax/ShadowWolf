require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Photo,
      :fun => "MyString",
      :bw => "MyString",
      :colour => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#config_model_fun[name=?]", "config_model[fun]"
      assert_select "input#config_model_bw[name=?]", "config_model[bw]"
      assert_select "input#config_model_colour[name=?]", "config_model[colour]"
    end
  end
end
