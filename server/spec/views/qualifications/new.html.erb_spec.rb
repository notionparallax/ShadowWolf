require 'spec_helper'

describe "qualifications/new" do
  before(:each) do
    assign(:qualification, stub_model(Qualification,
      :name => "MyString",
      :level => "MyString",
      :institution => "MyString",
      :first_year => 1,
      :last_year => 1
    ).as_new_record)
  end

  it "renders new qualification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", qualifications_path, "post" do
      assert_select "input#qualification_name[name=?]", "qualification[name]"
      assert_select "input#qualification_level[name=?]", "qualification[level]"
      assert_select "input#qualification_institution[name=?]", "qualification[institution]"
      assert_select "input#qualification_first_year[name=?]", "qualification[first_year]"
      assert_select "input#qualification_last_year[name=?]", "qualification[last_year]"
    end
  end
end
