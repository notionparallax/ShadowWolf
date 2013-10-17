require 'spec_helper'

describe "applicants/index" do
  before(:each) do
    assign(:applicants, [
      stub_model(Applicant),
      stub_model(Applicant)
    ])
  end

  it "renders a list of applicants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
