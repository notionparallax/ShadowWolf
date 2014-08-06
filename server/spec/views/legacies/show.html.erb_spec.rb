require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Legacy,
      :one_line_grab => "MyText",
      :dirty_pictures => "MyText",
      :dirty_testimonial => "MyText",
      :description_project_sheet => "MyText",
      :description_200_500_words => "MyText",
      :description_awards_style => "MyText",
      :dirty_awards => "Dirty Awards",
      :innovation_client_style => "MyText",
      :innovation_value_add => "MyText",
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
    rendered.should match(/Dirty Awards/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Security Level/)
  end
end
