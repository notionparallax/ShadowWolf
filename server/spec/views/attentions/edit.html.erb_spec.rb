require 'spec_helper'

describe "attentions/edit" do
  before(:each) do
    @attention = assign(:attention, stub_model(Attention,
      :url => "MyString",
      :scan_or_screengrab => "MyString",
      :body_text => "MyText",
      :publication => "MyString",
      :reason => "MyString"
    ))
  end

  it "renders the edit attention form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attention_path(@attention), "post" do
      assert_select "input#attention_url[name=?]", "attention[url]"
      assert_select "input#attention_scan_or_screengrab[name=?]", "attention[scan_or_screengrab]"
      assert_select "textarea#attention_body_text[name=?]", "attention[body_text]"
      assert_select "input#attention_publication[name=?]", "attention[publication]"
      assert_select "input#attention_reason[name=?]", "attention[reason]"
    end
  end
end
