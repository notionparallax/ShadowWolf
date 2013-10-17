require 'spec_helper'

describe "passports/new" do
  before(:each) do
    assign(:passport, stub_model(Passport,
      :number => "MyString",
      :issuing_body => "MyString"
    ).as_new_record)
  end

  it "renders new passport form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", passports_path, "post" do
      assert_select "input#passport_number[name=?]", "passport[number]"
      assert_select "input#passport_issuing_body[name=?]", "passport[issuing_body]"
    end
  end
end
