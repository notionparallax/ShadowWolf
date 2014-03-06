require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(Attention,
      :url => "MyString",
      :scan_or_screengrab => "MyString",
      :body_text => "MyText",
      :publication => "MyString",
      :reason => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attentions_path, "post" do
      assert_select "input#config_person_url[name=?]", "config_person[url]"
      assert_select "input#config_person_scan_or_screengrab[name=?]", "config_person[scan_or_screengrab]"
      assert_select "textarea#config_person_body_text[name=?]", "config_person[body_text]"
      assert_select "input#config_person_publication[name=?]", "config_person[publication]"
      assert_select "input#config_person_reason[name=?]", "config_person[reason]"
    end
  end
end
