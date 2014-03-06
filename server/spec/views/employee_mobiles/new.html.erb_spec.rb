require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(EmployeeMobile,
      :number => "MyString",
      :is_work => false,
      :distribute => false
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employee_mobiles_path, "post" do
      assert_select "input#config_person_number[name=?]", "config_person[number]"
      assert_select "input#config_person_is_work[name=?]", "config_person[is_work]"
      assert_select "input#config_person_distribute[name=?]", "config_person[distribute]"
    end
  end
end
