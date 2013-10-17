require 'spec_helper'

describe "frequent_flier_programs/edit" do
  before(:each) do
    @frequent_flier_program = assign(:frequent_flier_program, stub_model(FrequentFlierProgram,
      :name => "MyString",
      :number => "MyString"
    ))
  end

  it "renders the edit frequent_flier_program form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", frequent_flier_program_path(@frequent_flier_program), "post" do
      assert_select "input#frequent_flier_program_name[name=?]", "frequent_flier_program[name]"
      assert_select "input#frequent_flier_program_number[name=?]", "frequent_flier_program[number]"
    end
  end
end
