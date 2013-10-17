require 'spec_helper'

describe "finances/new" do
  before(:each) do
    assign(:finance, stub_model(Finance,
      :employee_code => "MyString"
    ).as_new_record)
  end

  it "renders new finance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", finances_path, "post" do
      assert_select "input#finance_employee_code[name=?]", "finance[employee_code]"
    end
  end
end
