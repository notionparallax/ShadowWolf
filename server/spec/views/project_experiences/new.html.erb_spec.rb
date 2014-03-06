require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(ProjectExperience,
      :name => "MyString",
      :firm => "MyString",
      :role => "MyString",
      :stage => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_experiences_path, "post" do
      assert_select "input#config_person_name[name=?]", "config_person[name]"
      assert_select "input#config_person_firm[name=?]", "config_person[firm]"
      assert_select "input#config_person_role[name=?]", "config_person[role]"
      assert_select "input#config_person_stage[name=?]", "config_person[stage]"
      assert_select "input#config_person_url[name=?]", "config_person[url]"
    end
  end
end
