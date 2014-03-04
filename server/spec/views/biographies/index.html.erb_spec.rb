require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:biographies, [
      stub_model(Biography,
        :one_line_bio => "One Line Bio",
        :approach => "MyText",
        :expertise => "MyText",
        :experience => "MyText",
        :achievements => "MyText",
        :value_statement => "MyText"
      ),
      stub_model(Biography,
        :one_line_bio => "One Line Bio",
        :approach => "MyText",
        :expertise => "MyText",
        :experience => "MyText",
        :achievements => "MyText",
        :value_statement => "MyText"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "One Line Bio".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
