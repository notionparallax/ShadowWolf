require 'spec_helper'

describe "conditions/show" do
  before(:each) do
    @condition = assign(:condition, stub_model(Condition,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
