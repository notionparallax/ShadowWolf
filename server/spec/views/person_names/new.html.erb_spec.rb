require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(PersonName,
      :prefix => "MyString",
      :first => "MyString",
      :middle => "MyString",
      :last => "MyString",
      :suffix => "MyString",
      :preferred_first => "MyString",
      :preferred_last => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_names_path, "post" do
      assert_select "input#config_person_prefix[name=?]", "config_person[prefix]"
      assert_select "input#config_person_first[name=?]", "config_person[first]"
      assert_select "input#config_person_middle[name=?]", "config_person[middle]"
      assert_select "input#config_person_last[name=?]", "config_person[last]"
      assert_select "input#config_person_suffix[name=?]", "config_person[suffix]"
      assert_select "input#config_person_preferred_first[name=?]", "config_person[preferred_first]"
      assert_select "input#config_person_preferred_last[name=?]", "config_person[preferred_last]"
    end
  end
end
