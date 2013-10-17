require 'spec_helper'

describe "presses/edit" do
  before(:each) do
    @press = assign(:press, stub_model(Press))
  end

  it "renders the edit press form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", press_path(@press), "post" do
    end
  end
end
