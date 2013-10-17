require 'spec_helper'

describe "preferences/new" do
  before(:each) do
    assign(:preference, stub_model(Preference,
      :likes => "MyText",
      :dislikes => "MyText"
    ).as_new_record)
  end

  it "renders new preference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", preferences_path, "post" do
      assert_select "textarea#preference_likes[name=?]", "preference[likes]"
      assert_select "textarea#preference_dislikes[name=?]", "preference[dislikes]"
    end
  end
end
