require 'spec_helper'

describe "socials/index" do
  before(:each) do
    assign(:socials, [
      stub_model(Social,
        :twitter => "Twitter",
        :instagram => "Instagram",
        :github => "Github",
        :pinterest => "Pinterest",
        :google_plus => "Google Plus",
        :linkedin => "Linkedin",
        :facebook => "Facebook",
        :tumblr => "Tumblr"
      ),
      stub_model(Social,
        :twitter => "Twitter",
        :instagram => "Instagram",
        :github => "Github",
        :pinterest => "Pinterest",
        :google_plus => "Google Plus",
        :linkedin => "Linkedin",
        :facebook => "Facebook",
        :tumblr => "Tumblr"
      )
    ])
  end

  it "renders a list of socials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Instagram".to_s, :count => 2
    assert_select "tr>td", :text => "Github".to_s, :count => 2
    assert_select "tr>td", :text => "Pinterest".to_s, :count => 2
    assert_select "tr>td", :text => "Google Plus".to_s, :count => 2
    assert_select "tr>td", :text => "Linkedin".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Tumblr".to_s, :count => 2
  end
end
