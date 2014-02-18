require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:initiatives, [
      stub_model(Initiative,
        :title => "Title",
        :reason => "Reason",
        :description => "MyText"
      ),
      stub_model(Initiative,
        :title => "Title",
        :reason => "Reason",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Reason".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
