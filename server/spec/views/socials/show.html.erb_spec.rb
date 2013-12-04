require 'spec_helper'

describe "config/models/show" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(Social,
      :twitter => "Twitter",
      :instagram => "Instagram",
      :github => "Github",
      :pinterest => "Pinterest",
      :google_plus => "Google Plus",
      :linkedin => "Linkedin",
      :facebook => "Facebook",
      :tumblr => "Tumblr"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Twitter/)
    rendered.should match(/Instagram/)
    rendered.should match(/Github/)
    rendered.should match(/Pinterest/)
    rendered.should match(/Google Plus/)
    rendered.should match(/Linkedin/)
    rendered.should match(/Facebook/)
    rendered.should match(/Tumblr/)
  end
end
