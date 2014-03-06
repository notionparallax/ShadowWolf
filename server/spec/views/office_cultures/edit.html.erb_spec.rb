require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(OfficeCulture,
      :first_aider => false,
      :fire_warden => false
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_first_aider[name=?]", "config_person[first_aider]"
      assert_select "input#config_person_fire_warden[name=?]", "config_person[fire_warden]"
    end
  end
end
