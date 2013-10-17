require 'spec_helper'

describe "frequent_flier_programs/new" do
  before(:each) do
    assign(:frequent_flier_program, stub_model(FrequentFlierProgram,
      :name => "MyString",
      :number => "MyString"
    ).as_new_record)
  end

  it "renders new frequent_flier_program form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", frequent_flier_programs_path, "post" do
      assert_select "input#frequent_flier_program_name[name=?]", "frequent_flier_program[name]"
      assert_select "input#frequent_flier_program_number[name=?]", "frequent_flier_program[number]"
    end
  end
end
