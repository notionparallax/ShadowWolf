require 'spec_helper'

describe "config/people/show" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Attention,
      :url => "Url",
      :scan_or_screengrab => "Scan Or Screengrab",
      :body_text => "MyText",
      :publication => "Publication",
      :reason => "Reason"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/Scan Or Screengrab/)
    rendered.should match(/MyText/)
    rendered.should match(/Publication/)
    rendered.should match(/Reason/)
  end
end
