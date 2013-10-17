require 'spec_helper'

describe "applicants/show" do
  before(:each) do
    @applicant = assign(:applicant, stub_model(Applicant))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
