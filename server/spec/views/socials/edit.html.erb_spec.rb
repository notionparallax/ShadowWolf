require 'spec_helper'

describe "socials/edit" do
  before(:each) do
    @social = assign(:social, stub_model(Social,
      :twitter => "MyString",
      :instagram => "MyString",
      :github => "MyString",
      :pinterest => "MyString",
      :google_plus => "MyString",
      :linkedin => "MyString",
      :facebook => "MyString",
      :tumblr => "MyString"
    ))
  end

  it "renders the edit social form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", social_path(@social), "post" do
      assert_select "input#social_twitter[name=?]", "social[twitter]"
      assert_select "input#social_instagram[name=?]", "social[instagram]"
      assert_select "input#social_github[name=?]", "social[github]"
      assert_select "input#social_pinterest[name=?]", "social[pinterest]"
      assert_select "input#social_google_plus[name=?]", "social[google_plus]"
      assert_select "input#social_linkedin[name=?]", "social[linkedin]"
      assert_select "input#social_facebook[name=?]", "social[facebook]"
      assert_select "input#social_tumblr[name=?]", "social[tumblr]"
    end
  end
end
