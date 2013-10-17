require 'spec_helper'

describe "biographies/show" do
  before(:each) do
    @biography = assign(:biography, stub_model(Biography,
      :one_line_bio => "One Line Bio",
      :approach => "MyText",
      :expertise => "MyText",
      :experience => "MyText",
      :achievements => "MyText",
      :value_statement => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/One Line Bio/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
