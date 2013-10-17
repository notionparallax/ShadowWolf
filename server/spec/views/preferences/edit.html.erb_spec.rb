require 'spec_helper'

describe "preferences/edit" do
  before(:each) do
    @preference = assign(:preference, stub_model(Preference,
      :likes => "MyText",
      :dislikes => "MyText"
    ))
  end

  it "renders the edit preference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", preference_path(@preference), "post" do
      assert_select "textarea#preference_likes[name=?]", "preference[likes]"
      assert_select "textarea#preference_dislikes[name=?]", "preference[dislikes]"
    end
  end
end
