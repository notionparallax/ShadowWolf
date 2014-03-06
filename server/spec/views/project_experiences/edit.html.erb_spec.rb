require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(ProjectExperience,
      :name => "MyString",
      :firm => "MyString",
      :role => "MyString",
      :stage => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_name[name=?]", "config_person[name]"
      assert_select "input#config_person_firm[name=?]", "config_person[firm]"
      assert_select "input#config_person_role[name=?]", "config_person[role]"
      assert_select "input#config_person_stage[name=?]", "config_person[stage]"
      assert_select "input#config_person_url[name=?]", "config_person[url]"
    end
  end
end
