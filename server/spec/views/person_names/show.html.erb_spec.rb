require 'spec_helper'

describe "config/models/show" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(PersonName,
      :prefix => "Prefix",
      :first => "First",
      :middle => "Middle",
      :last => "Last",
      :suffix => "Suffix",
      :preferred_first => "Preferred First",
      :preferred_last => "Preferred Last"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Prefix/)
    rendered.should match(/First/)
    rendered.should match(/Middle/)
    rendered.should match(/Last/)
    rendered.should match(/Suffix/)
    rendered.should match(/Preferred First/)
    rendered.should match(/Preferred Last/)
  end
end
