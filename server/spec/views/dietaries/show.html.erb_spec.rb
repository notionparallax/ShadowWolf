require 'spec_helper'

describe "dietaries/show" do
  before(:each) do
    @dietary = assign(:dietary, stub_model(Dietary,
      :requirements => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
