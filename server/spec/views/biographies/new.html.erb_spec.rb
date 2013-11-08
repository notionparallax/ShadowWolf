require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Biography,
      :one_line_bio => "MyString",
      :approach => "MyText",
      :expertise => "MyText",
      :experience => "MyText",
      :achievements => "MyText",
      :value_statement => "MyText"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", biographies_path, "post" do
      assert_select "input#config_model_one_line_bio[name=?]", "config_model[one_line_bio]"
      assert_select "textarea#config_model_approach[name=?]", "config_model[approach]"
      assert_select "textarea#config_model_expertise[name=?]", "config_model[expertise]"
      assert_select "textarea#config_model_experience[name=?]", "config_model[experience]"
      assert_select "textarea#config_model_achievements[name=?]", "config_model[achievements]"
      assert_select "textarea#config_model_value_statement[name=?]", "config_model[value_statement]"
    end
  end
end
