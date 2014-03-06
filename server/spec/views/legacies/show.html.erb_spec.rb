require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Legacy,
      :one_line_grab => "MyText",
      :description_project_sheet => "MyText",
      :description_awards_style => "MyText",
      :innovation_client_style => "MyText",
      :interesting_things => "MyText",
      :brief_elements => "MyText",
      :security_level => "Security Level"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Security Level/)
  end
end
