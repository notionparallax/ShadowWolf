require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :fun => "MyString",
      :bw => "MyString",
      :colour => "MyString"
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do
      assert_select "input#photo_fun[name=?]", "photo[fun]"
      assert_select "input#photo_bw[name=?]", "photo[bw]"
      assert_select "input#photo_colour[name=?]", "photo[colour]"
    end
  end
end
