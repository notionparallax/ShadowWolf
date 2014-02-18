require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Initiative,
      :title => "Title",
      :reason => "Reason",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Reason/)
    rendered.should match(/MyText/)
  end
end
