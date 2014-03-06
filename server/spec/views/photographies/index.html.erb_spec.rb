require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:photographies, [
      stub_model(Photography,
        :photographer => "Photographer"
      ),
      stub_model(Photography,
        :photographer => "Photographer"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Photographer".to_s, :count => 2
  end
end
