require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(FrequentFlierProgram,
      :name => "MyString",
      :number => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", frequent_flier_programs_path, "post" do
      assert_select "input#config_person_name[name=?]", "config_person[name]"
      assert_select "input#config_person_number[name=?]", "config_person[number]"
    end
  end
end
