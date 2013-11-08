require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(FrequentFlierProgram,
      :name => "MyString",
      :number => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", frequent_flier_programs_path, "post" do
      assert_select "input#config_model_name[name=?]", "config_model[name]"
      assert_select "input#config_model_number[name=?]", "config_model[number]"
    end
  end
end
