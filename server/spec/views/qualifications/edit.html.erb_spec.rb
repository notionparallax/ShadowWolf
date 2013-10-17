require 'spec_helper'

describe "qualifications/edit" do
  before(:each) do
    @qualification = assign(:qualification, stub_model(Qualification,
      :name => "MyString",
      :level => "MyString",
      :institution => "MyString",
      :first_year => 1,
      :last_year => 1
    ))
  end

  it "renders the edit qualification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", qualification_path(@qualification), "post" do
      assert_select "input#qualification_name[name=?]", "qualification[name]"
      assert_select "input#qualification_level[name=?]", "qualification[level]"
      assert_select "input#qualification_institution[name=?]", "qualification[institution]"
      assert_select "input#qualification_first_year[name=?]", "qualification[first_year]"
      assert_select "input#qualification_last_year[name=?]", "qualification[last_year]"
    end
  end
end
