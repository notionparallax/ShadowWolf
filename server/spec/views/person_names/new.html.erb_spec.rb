require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(PersonName,
      :prefix => "MyString",
      :first => "MyString",
      :middle => "MyString",
      :last => "MyString",
      :suffix => "MyString",
      :preferred_first => "MyString",
      :preferred_last => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_names_path, "post" do
      assert_select "input#config_model_prefix[name=?]", "config_model[prefix]"
      assert_select "input#config_model_first[name=?]", "config_model[first]"
      assert_select "input#config_model_middle[name=?]", "config_model[middle]"
      assert_select "input#config_model_last[name=?]", "config_model[last]"
      assert_select "input#config_model_suffix[name=?]", "config_model[suffix]"
      assert_select "input#config_model_preferred_first[name=?]", "config_model[preferred_first]"
      assert_select "input#config_model_preferred_last[name=?]", "config_model[preferred_last]"
    end
  end
end
