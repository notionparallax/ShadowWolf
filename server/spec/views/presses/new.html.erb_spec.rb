require 'spec_helper'

describe "presses/new" do
  before(:each) do
    assign(:press, stub_model(Press).as_new_record)
  end

  it "renders new press form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", presses_path, "post" do
    end
  end
end
