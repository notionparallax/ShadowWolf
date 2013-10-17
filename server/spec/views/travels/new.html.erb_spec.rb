require 'spec_helper'

describe "travels/new" do
  before(:each) do
    assign(:travel, stub_model(Travel).as_new_record)
  end

  it "renders new travel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", travels_path, "post" do
    end
  end
end
