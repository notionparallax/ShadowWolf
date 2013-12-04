require 'spec_helper'

describe "config/models/show" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(PersonalAward,
      :name => "Name",
      :awarding_body => "Awarding Body",
      :description => "MyText",
      :url => "Url",
      :year_achieved => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Awarding Body/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/1/)
  end
end
