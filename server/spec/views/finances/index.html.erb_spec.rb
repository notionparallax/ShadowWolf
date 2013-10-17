require 'spec_helper'

describe "finances/index" do
  before(:each) do
    assign(:finances, [
      stub_model(Finance,
        :employee_code => "Employee Code"
      ),
      stub_model(Finance,
        :employee_code => "Employee Code"
      )
    ])
  end

  it "renders a list of finances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Employee Code".to_s, :count => 2
  end
end
