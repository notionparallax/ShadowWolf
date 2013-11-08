require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Travel).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", travels_path, "post" do
    end
  end
end
