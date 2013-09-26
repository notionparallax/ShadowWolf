require 'spec_helper'

describe "person_names/new" do
  before(:each) do
    assign(:person_name, stub_model(PersonName,
      :first => "MyString",
      :last => "MyString",
      :preferred_first => "MyString",
      :preferred_last => "MyString"
    ).as_new_record)
  end

  it "renders new person_name form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_names_path, "post" do
      assert_select "input#person_name_first[name=?]", "person_name[first]"
      assert_select "input#person_name_last[name=?]", "person_name[last]"
      assert_select "input#person_name_preferred_first[name=?]", "person_name[preferred_first]"
      assert_select "input#person_name_preferred_last[name=?]", "person_name[preferred_last]"
    end
  end
end
