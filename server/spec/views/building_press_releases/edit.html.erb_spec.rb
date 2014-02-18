require 'spec_helper'

describe "config/projects/edit" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(BuildingPressRelease,
      :channel_list => "MyString",
      :content => "MyText",
      :author_login => "MyString"
    ))
  end

  it "renders the edit config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_project_path(@config_project), "post" do
      assert_select "input#config_project_channel_list[name=?]", "config_project[channel_list]"
      assert_select "textarea#config_project_content[name=?]", "config_project[content]"
      assert_select "input#config_project_author_login[name=?]", "config_project[author_login]"
    end
  end
end
