require 'spec_helper'

describe "biographies/new" do
  before(:each) do
    assign(:biography, stub_model(Biography,
      :one_line_bio => "MyString",
      :approach => "MyText",
      :expertise => "MyText",
      :experience => "MyText",
      :achievements => "MyText",
      :value_statement => "MyText"
    ).as_new_record)
  end

  it "renders new biography form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", biographies_path, "post" do
      assert_select "input#biography_one_line_bio[name=?]", "biography[one_line_bio]"
      assert_select "textarea#biography_approach[name=?]", "biography[approach]"
      assert_select "textarea#biography_expertise[name=?]", "biography[expertise]"
      assert_select "textarea#biography_experience[name=?]", "biography[experience]"
      assert_select "textarea#biography_achievements[name=?]", "biography[achievements]"
      assert_select "textarea#biography_value_statement[name=?]", "biography[value_statement]"
    end
  end
end
