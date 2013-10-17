require 'spec_helper'

describe "finances/show" do
  before(:each) do
    @finance = assign(:finance, stub_model(Finance,
      :employee_code => "Employee Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Employee Code/)
  end
end
