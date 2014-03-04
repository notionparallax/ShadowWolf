require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(Biography,
      :one_line_bio => "MyString",
      :approach => "MyText",
      :expertise => "MyText",
      :experience => "MyText",
      :achievements => "MyText",
      :value_statement => "MyText"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", biographies_path, "post" do
      assert_select "input#config_person_one_line_bio[name=?]", "config_person[one_line_bio]"
      assert_select "textarea#config_person_approach[name=?]", "config_person[approach]"
      assert_select "textarea#config_person_expertise[name=?]", "config_person[expertise]"
      assert_select "textarea#config_person_experience[name=?]", "config_person[experience]"
      assert_select "textarea#config_person_achievements[name=?]", "config_person[achievements]"
      assert_select "textarea#config_person_value_statement[name=?]", "config_person[value_statement]"
    end
  end
end
