require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(Preference,
      :likes => "MyText",
      :dislikes => "MyText"
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "textarea#config_model_likes[name=?]", "config_model[likes]"
      assert_select "textarea#config_model_dislikes[name=?]", "config_model[dislikes]"
    end
  end
end
