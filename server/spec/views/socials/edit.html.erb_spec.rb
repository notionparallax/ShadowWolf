require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Social,
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

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_twitter[name=?]", "config_person[twitter]"
      assert_select "input#config_person_instagram[name=?]", "config_person[instagram]"
      assert_select "input#config_person_github[name=?]", "config_person[github]"
      assert_select "input#config_person_pinterest[name=?]", "config_person[pinterest]"
      assert_select "input#config_person_google_plus[name=?]", "config_person[google_plus]"
      assert_select "input#config_person_linkedin[name=?]", "config_person[linkedin]"
      assert_select "input#config_person_facebook[name=?]", "config_person[facebook]"
      assert_select "input#config_person_tumblr[name=?]", "config_person[tumblr]"
    end
  end
end
