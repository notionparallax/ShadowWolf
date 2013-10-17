require 'spec_helper'

describe "person_names/index" do
  before(:each) do
    assign(:person_names, [
      stub_model(PersonName,
        :prefix => "Prefix",
        :first => "First",
        :middle => "Middle",
        :last => "Last",
        :suffix => "Suffix",
        :preferred_first => "Preferred First",
        :preferred_last => "Preferred Last"
      ),
      stub_model(PersonName,
        :prefix => "Prefix",
        :first => "First",
        :middle => "Middle",
        :last => "Last",
        :suffix => "Suffix",
        :preferred_first => "Preferred First",
        :preferred_last => "Preferred Last"
      )
    ])
  end

  it "renders a list of person_names" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Prefix".to_s, :count => 2
    assert_select "tr>td", :text => "First".to_s, :count => 2
    assert_select "tr>td", :text => "Middle".to_s, :count => 2
    assert_select "tr>td", :text => "Last".to_s, :count => 2
    assert_select "tr>td", :text => "Suffix".to_s, :count => 2
    assert_select "tr>td", :text => "Preferred First".to_s, :count => 2
    assert_select "tr>td", :text => "Preferred Last".to_s, :count => 2
  end
end
