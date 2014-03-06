require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(Preference,
      :likes => "MyText",
      :dislikes => "MyText"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", preferences_path, "post" do
      assert_select "textarea#config_person_likes[name=?]", "config_person[likes]"
      assert_select "textarea#config_person_dislikes[name=?]", "config_person[dislikes]"
    end
  end
end
