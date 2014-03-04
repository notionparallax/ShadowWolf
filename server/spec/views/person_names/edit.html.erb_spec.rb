require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(PersonName,
      :prefix => "MyString",
      :first => "MyString",
      :middle => "MyString",
      :last => "MyString",
      :suffix => "MyString",
      :preferred_first => "MyString",
      :preferred_last => "MyString"
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
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
