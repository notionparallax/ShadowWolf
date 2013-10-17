require 'spec_helper'

describe "passports/show" do
  before(:each) do
    @passport = assign(:passport, stub_model(Passport,
      :number => "Number",
      :issuing_body => "Issuing Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(/Issuing Body/)
  end
end
