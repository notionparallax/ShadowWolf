require 'spec_helper'

describe "mobiles/new" do
  before(:each) do
    assign(:mobile, stub_model(Mobile,
      :number => "MyString",
      :is_bvn => false,
      :distribute => false
    ).as_new_record)
  end

  it "renders new mobile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mobiles_path, "post" do
      assert_select "input#mobile_number[name=?]", "mobile[number]"
      assert_select "input#mobile_is_bvn[name=?]", "mobile[is_bvn]"
      assert_select "input#mobile_distribute[name=?]", "mobile[distribute]"
    end
  end
end
