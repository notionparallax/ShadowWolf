require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Qualification,
      :name => "MyString",
      :level => "MyString",
      :institution => "MyString",
      :first_year => 1,
      :last_year => 1
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", qualifications_path, "post" do
      assert_select "input#config_model_name[name=?]", "config_model[name]"
      assert_select "input#config_model_level[name=?]", "config_model[level]"
      assert_select "input#config_model_institution[name=?]", "config_model[institution]"
      assert_select "input#config_model_first_year[name=?]", "config_model[first_year]"
      assert_select "input#config_model_last_year[name=?]", "config_model[last_year]"
    end
  end
end
