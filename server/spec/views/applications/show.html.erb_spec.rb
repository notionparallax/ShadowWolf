require 'spec_helper'

describe "config/people/show" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Application,
      :covering_letter => "Covering Letter",
      :portfolio => "Portfolio",
      :assessment => "MyText",
      :future_consideration => false,
      :skills_and_keywords => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Covering Letter/)
    rendered.should match(/Portfolio/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
  end
end
