require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Qualification,
      :name => "MyString",
      :level => "MyString",
      :institution => "MyString",
      :first_year => 1,
      :last_year => 1
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_name[name=?]", "config_person[name]"
      assert_select "input#config_person_level[name=?]", "config_person[level]"
      assert_select "input#config_person_institution[name=?]", "config_person[institution]"
      assert_select "input#config_person_first_year[name=?]", "config_person[first_year]"
      assert_select "input#config_person_last_year[name=?]", "config_person[last_year]"
    end
  end
end
