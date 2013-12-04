require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Passport,
      :number => "MyString",
      :issuing_body => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", passports_path, "post" do
      assert_select "input#config_model_number[name=?]", "config_model[number]"
      assert_select "input#config_model_issuing_body[name=?]", "config_model[issuing_body]"
    end
  end
end
