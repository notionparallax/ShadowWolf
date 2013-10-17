require 'spec_helper'

describe "frequent_flier_programs/show" do
  before(:each) do
    @frequent_flier_program = assign(:frequent_flier_program, stub_model(FrequentFlierProgram,
      :name => "Name",
      :number => "Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Number/)
  end
end
