require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(Award,
      :award => "MyString",
      :jury => ""
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", awards_path, "post" do
      assert_select "input#config_project_award[name=?]", "config_project[award]"
      assert_select "input#config_project_jury[name=?]", "config_project[jury]"
    end
  end
end
