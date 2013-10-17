require 'spec_helper'

describe "travels/edit" do
  before(:each) do
    @travel = assign(:travel, stub_model(Travel))
  end

  it "renders the edit travel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", travel_path(@travel), "post" do
    end
  end
end
