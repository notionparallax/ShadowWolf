require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(Biography,
      :one_line_bio => "MyString",
      :approach => "MyText",
      :expertise => "MyText",
      :experience => "MyText",
      :achievements => "MyText",
      :value_statement => "MyText"
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "input#config_model_one_line_bio[name=?]", "config_model[one_line_bio]"
      assert_select "textarea#config_model_approach[name=?]", "config_model[approach]"
      assert_select "textarea#config_model_expertise[name=?]", "config_model[expertise]"
      assert_select "textarea#config_model_experience[name=?]", "config_model[experience]"
      assert_select "textarea#config_model_achievements[name=?]", "config_model[achievements]"
      assert_select "textarea#config_model_value_statement[name=?]", "config_model[value_statement]"
    end
  end
end
