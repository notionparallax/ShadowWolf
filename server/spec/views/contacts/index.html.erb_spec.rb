require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :extension => "Extension",
        :studio => "Studio"
      ),
      stub_model(Contact,
        :extension => "Extension",
        :studio => "Studio"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Extension".to_s, :count => 2
    assert_select "tr>td", :text => "Studio".to_s, :count => 2
  end
end
