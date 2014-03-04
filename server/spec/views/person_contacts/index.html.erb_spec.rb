require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:person_contacts, [
      stub_model(PersonContact,
        :personal_email => "Personal Email",
        :personal_phone => "Personal Phone"
      ),
      stub_model(PersonContact,
        :personal_email => "Personal Email",
        :personal_phone => "Personal Phone"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Personal Email".to_s, :count => 2
    assert_select "tr>td", :text => "Personal Phone".to_s, :count => 2
  end
end
