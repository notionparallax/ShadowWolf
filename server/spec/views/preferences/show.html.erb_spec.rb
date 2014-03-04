require 'spec_helper'

describe "config/people/show" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Preference,
      :likes => "MyText",
      :dislikes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
