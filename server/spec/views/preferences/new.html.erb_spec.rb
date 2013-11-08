require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Preference,
      :likes => "MyText",
      :dislikes => "MyText"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", preferences_path, "post" do
      assert_select "textarea#config_model_likes[name=?]", "config_model[likes]"
      assert_select "textarea#config_model_dislikes[name=?]", "config_model[dislikes]"
    end
  end
end
