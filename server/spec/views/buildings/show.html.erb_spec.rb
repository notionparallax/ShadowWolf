require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Building,
      :description => "MyText",
      :attribution => "Attribution",
      :BCA_classification => "Bca Classification",
      :project_catagories => "",
      :project_sub-catagories => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Attribution/)
    rendered.should match(/Bca Classification/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
