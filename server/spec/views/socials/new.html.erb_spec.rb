require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Social,
      :twitter => "MyString",
      :instagram => "MyString",
      :github => "MyString",
      :pinterest => "MyString",
      :google_plus => "MyString",
      :linkedin => "MyString",
      :facebook => "MyString",
      :tumblr => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", socials_path, "post" do
      assert_select "input#config_model_twitter[name=?]", "config_model[twitter]"
      assert_select "input#config_model_instagram[name=?]", "config_model[instagram]"
      assert_select "input#config_model_github[name=?]", "config_model[github]"
      assert_select "input#config_model_pinterest[name=?]", "config_model[pinterest]"
      assert_select "input#config_model_google_plus[name=?]", "config_model[google_plus]"
      assert_select "input#config_model_linkedin[name=?]", "config_model[linkedin]"
      assert_select "input#config_model_facebook[name=?]", "config_model[facebook]"
      assert_select "input#config_model_tumblr[name=?]", "config_model[tumblr]"
    end
  end
end
