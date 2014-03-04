require 'spec_helper'

describe "config/people/show" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(PersonContact,
      :personal_email => "Personal Email",
      :personal_phone => "Personal Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Personal Email/)
    rendered.should match(/Personal Phone/)
  end
end
