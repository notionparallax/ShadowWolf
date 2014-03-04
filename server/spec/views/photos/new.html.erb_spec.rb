require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(Photo,
      :fun => "MyString",
      :bw => "MyString",
      :colour => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#config_person_fun[name=?]", "config_person[fun]"
      assert_select "input#config_person_bw[name=?]", "config_person[bw]"
      assert_select "input#config_person_colour[name=?]", "config_person[colour]"
    end
  end
end
