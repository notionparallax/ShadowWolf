require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :fun => "Fun",
      :bw => "Bw",
      :colour => "Colour"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fun/)
    rendered.should match(/Bw/)
    rendered.should match(/Colour/)
  end
end
