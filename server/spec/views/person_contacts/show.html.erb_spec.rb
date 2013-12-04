require 'spec_helper'

describe "config/models/show" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(PersonContact,
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
