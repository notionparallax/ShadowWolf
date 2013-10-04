require 'spec_helper'

describe "contacts/new" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :extension => "MyString",
      :studio => "MyString"
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contacts_path, "post" do
      assert_select "input#contact_extension[name=?]", "contact[extension]"
      assert_select "input#contact_studio[name=?]", "contact[studio]"
    end
  end
end
