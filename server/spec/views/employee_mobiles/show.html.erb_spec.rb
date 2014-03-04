require 'spec_helper'

describe "config/people/show" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(EmployeeMobile,
      :number => "Number",
      :is_work => false,
      :distribute => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
