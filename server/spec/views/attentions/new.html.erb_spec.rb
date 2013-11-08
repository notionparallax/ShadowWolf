require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Attention,
      :url => "MyString",
      :scan_or_screengrab => "MyString",
      :body_text => "MyText",
      :publication => "MyString",
      :reason => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attentions_path, "post" do
      assert_select "input#config_model_url[name=?]", "config_model[url]"
      assert_select "input#config_model_scan_or_screengrab[name=?]", "config_model[scan_or_screengrab]"
      assert_select "textarea#config_model_body_text[name=?]", "config_model[body_text]"
      assert_select "input#config_model_publication[name=?]", "config_model[publication]"
      assert_select "input#config_model_reason[name=?]", "config_model[reason]"
    end
  end
end
