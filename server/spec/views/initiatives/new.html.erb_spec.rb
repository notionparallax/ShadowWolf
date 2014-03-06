require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(Initiative,
      :title => "MyString",
      :reason => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", initiatives_path, "post" do
      assert_select "input#config_project_title[name=?]", "config_project[title]"
      assert_select "input#config_project_reason[name=?]", "config_project[reason]"
      assert_select "textarea#config_project_description[name=?]", "config_project[description]"
    end
  end
end
