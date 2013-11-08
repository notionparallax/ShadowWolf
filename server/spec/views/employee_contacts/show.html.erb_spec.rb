require 'spec_helper'

describe "config/models/show" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(EmployeeContact,
      :extension => "Extension",
      :studio => "Studio",
      :work_email => "Work Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Extension/)
    rendered.should match(/Studio/)
    rendered.should match(/Work Email/)
  end
end
