require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(OfficeCulture,
      :first_aider => false,
      :fire_warden => false
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", office_cultures_path, "post" do
      assert_select "input#config_model_first_aider[name=?]", "config_model[first_aider]"
      assert_select "input#config_model_fire_warden[name=?]", "config_model[fire_warden]"
    end
  end
end
