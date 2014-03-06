require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:office_cultures, [
      stub_model(OfficeCulture,
        :first_aider => false,
        :fire_warden => false
      ),
      stub_model(OfficeCulture,
        :first_aider => false,
        :fire_warden => false
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
