require 'spec_helper'

describe "presses/show" do
  before(:each) do
    @press = assign(:press, stub_model(Press))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
