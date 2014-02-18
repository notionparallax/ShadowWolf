require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(Client,
      :main => "MyString",
      :direct => "MyString",
      :end_user => "MyString"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", clients_path, "post" do
      assert_select "input#config_project_main[name=?]", "config_project[main]"
      assert_select "input#config_project_direct[name=?]", "config_project[direct]"
      assert_select "input#config_project_end_user[name=?]", "config_project[end_user]"
    end
  end
end
