require 'spec_helper'

describe "config/projects/edit" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Client,
      :main => "MyString",
      :direct => "MyString",
      :end_user => "MyString"
    ))
  end

  it "renders the edit config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_project_path(@config_project), "post" do
      assert_select "input#config_project_main[name=?]", "config_project[main]"
      assert_select "input#config_project_direct[name=?]", "config_project[direct]"
      assert_select "input#config_project_end_user[name=?]", "config_project[end_user]"
    end
  end
end
