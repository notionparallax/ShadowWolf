require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(BuildingPressRelease,
      :channel_list => "Channel List",
      :content => "MyText",
      :author_login => "Author Login"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Channel List/)
    rendered.should match(/MyText/)
    rendered.should match(/Author Login/)
  end
end
