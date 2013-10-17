require 'spec_helper'

describe "person_contacts/show" do
  before(:each) do
    @person_contact = assign(:person_contact, stub_model(PersonContact,
      :personal_email => "Personal Email",
      :personal_phone => "Personal Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Personal Email/)
    rendered.should match(/Personal Phone/)
  end
end
