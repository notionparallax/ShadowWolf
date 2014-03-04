require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(Finance,
      :employee_code => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", finances_path, "post" do
      assert_select "input#config_person_employee_code[name=?]", "config_person[employee_code]"
    end
  end
end
