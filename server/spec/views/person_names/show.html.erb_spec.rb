require 'spec_helper'

describe "person_names/show" do
  before(:each) do
    @person_name = assign(:person_name, stub_model(PersonName,
      :first => "First",
      :last => "Last",
      :preferred_first => "Preferred First",
      :preferred_last => "Preferred Last"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First/)
    rendered.should match(/Last/)
    rendered.should match(/Preferred First/)
    rendered.should match(/Preferred Last/)
  end
end
