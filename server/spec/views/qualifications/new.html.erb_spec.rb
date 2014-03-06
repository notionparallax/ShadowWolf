require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(Qualification,
      :name => "MyString",
      :level => "MyString",
      :institution => "MyString",
      :first_year => 1,
      :last_year => 1
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", qualifications_path, "post" do
      assert_select "input#config_person_name[name=?]", "config_person[name]"
      assert_select "input#config_person_level[name=?]", "config_person[level]"
      assert_select "input#config_person_institution[name=?]", "config_person[institution]"
      assert_select "input#config_person_first_year[name=?]", "config_person[first_year]"
      assert_select "input#config_person_last_year[name=?]", "config_person[last_year]"
    end
  end
end
