require 'spec_helper'

describe "applicants/edit" do
  before(:each) do
    @applicant = assign(:applicant, stub_model(Applicant))
  end

  it "renders the edit applicant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", applicant_path(@applicant), "post" do
    end
  end
end
