require 'spec_helper'

describe "finances/edit" do
  before(:each) do
    @finance = assign(:finance, stub_model(Finance,
      :employee_code => "MyString"
    ))
  end

  it "renders the edit finance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", finance_path(@finance), "post" do
      assert_select "input#finance_employee_code[name=?]", "finance[employee_code]"
    end
  end
end
