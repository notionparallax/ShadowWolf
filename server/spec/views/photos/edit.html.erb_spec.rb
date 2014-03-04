require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Photo,
      :fun => "MyString",
      :bw => "MyString",
      :colour => "MyString"
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_fun[name=?]", "config_person[fun]"
      assert_select "input#config_person_bw[name=?]", "config_person[bw]"
      assert_select "input#config_person_colour[name=?]", "config_person[colour]"
    end
  end
end
