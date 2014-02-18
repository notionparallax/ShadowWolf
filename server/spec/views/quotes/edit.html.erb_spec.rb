require 'spec_helper'

describe "config/projects/edit" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Quote,
      :quote => "MyText",
      :citation => "MyString"
    ))
  end

  it "renders the edit config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_project_path(@config_project), "post" do
      assert_select "textarea#config_project_quote[name=?]", "config_project[quote]"
      assert_select "input#config_project_citation[name=?]", "config_project[citation]"
    end
  end
end
