require 'spec_helper'

describe "passports/edit" do
  before(:each) do
    @passport = assign(:passport, stub_model(Passport,
      :number => "MyString",
      :issuing_body => "MyString"
    ))
  end

  it "renders the edit passport form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", passport_path(@passport), "post" do
      assert_select "input#passport_number[name=?]", "passport[number]"
      assert_select "input#passport_issuing_body[name=?]", "passport[issuing_body]"
    end
  end
end
