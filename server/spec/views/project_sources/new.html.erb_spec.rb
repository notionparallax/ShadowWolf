require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(ProjectSource,
      :competition_win => false,
      :competition_URL => "MyString"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_sources_path, "post" do
      assert_select "input#config_project_competition_win[name=?]", "config_project[competition_win]"
      assert_select "input#config_project_competition_URL[name=?]", "config_project[competition_URL]"
    end
  end
end
