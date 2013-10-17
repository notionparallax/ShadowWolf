require 'spec_helper'

describe "travels/show" do
  before(:each) do
    @travel = assign(:travel, stub_model(Travel))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
