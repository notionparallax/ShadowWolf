require 'spec_helper'

describe "config/people/show" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(EmployeeContact,
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
