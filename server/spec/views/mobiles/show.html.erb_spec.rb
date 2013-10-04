require 'spec_helper'

describe "mobiles/show" do
  before(:each) do
    @mobile = assign(:mobile, stub_model(Mobile,
      :number => "Number",
      :is_bvn => false,
      :distribute => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
