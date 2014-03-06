require 'spec_helper'

describe "config/projects/edit" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Certification,
      :name => "MyString",
      :ranking => "MyString",
      :awarding_body => "MyString"
    ))
  end

  it "renders the edit config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_project_path(@config_project), "post" do
      assert_select "input#config_project_name[name=?]", "config_project[name]"
      assert_select "input#config_project_ranking[name=?]", "config_project[ranking]"
      assert_select "input#config_project_awarding_body[name=?]", "config_project[awarding_body]"
    end
  end
end
