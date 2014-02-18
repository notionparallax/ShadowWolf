require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(Quote,
      :quote => "MyText",
      :citation => "MyString"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quotes_path, "post" do
      assert_select "textarea#config_project_quote[name=?]", "config_project[quote]"
      assert_select "input#config_project_citation[name=?]", "config_project[citation]"
    end
  end
end
