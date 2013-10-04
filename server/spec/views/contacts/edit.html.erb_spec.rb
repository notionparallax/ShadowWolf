require 'spec_helper'

describe "contacts/edit" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :extension => "MyString",
      :studio => "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do
      assert_select "input#contact_extension[name=?]", "contact[extension]"
      assert_select "input#contact_studio[name=?]", "contact[studio]"
    end
  end
end
