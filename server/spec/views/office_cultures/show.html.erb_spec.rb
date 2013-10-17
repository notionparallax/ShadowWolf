require 'spec_helper'

describe "office_cultures/show" do
  before(:each) do
    @office_culture = assign(:office_culture, stub_model(OfficeCulture,
      :first_aider => false,
      :fire_warden => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
