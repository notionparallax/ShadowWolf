require 'spec_helper'

describe "config/projects/edit" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(BuildingAttention,
      :url => "MyString",
      :scan_or_screengrab => "MyString",
      :body_text => "MyText",
      :publication => "MyString",
      :reason => "MyString"
    ))
  end

  it "renders the edit config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_project_path(@config_project), "post" do
      assert_select "input#config_project_url[name=?]", "config_project[url]"
      assert_select "input#config_project_scan_or_screengrab[name=?]", "config_project[scan_or_screengrab]"
      assert_select "textarea#config_project_body_text[name=?]", "config_project[body_text]"
      assert_select "input#config_project_publication[name=?]", "config_project[publication]"
      assert_select "input#config_project_reason[name=?]", "config_project[reason]"
    end
  end
end
