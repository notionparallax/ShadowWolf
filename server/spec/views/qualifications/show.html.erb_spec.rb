require 'spec_helper'

describe "qualifications/show" do
  before(:each) do
    @qualification = assign(:qualification, stub_model(Qualification,
      :name => "Name",
      :level => "Level",
      :institution => "Institution",
      :first_year => 1,
      :last_year => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Level/)
    rendered.should match(/Institution/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
