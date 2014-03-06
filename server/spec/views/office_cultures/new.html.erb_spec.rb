require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(OfficeCulture,
      :first_aider => false,
      :fire_warden => false
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", office_cultures_path, "post" do
      assert_select "input#config_person_first_aider[name=?]", "config_person[first_aider]"
      assert_select "input#config_person_fire_warden[name=?]", "config_person[fire_warden]"
    end
  end
end
