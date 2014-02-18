require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:referred_bies, [
      stub_model(ReferredBy,
        :BVN_staff_login => "Bvn Staff Login",
        :contact_name => "Contact Name",
        :contact_organisation => "Contact Organisation"
      ),
      stub_model(ReferredBy,
        :BVN_staff_login => "Bvn Staff Login",
        :contact_name => "Contact Name",
        :contact_organisation => "Contact Organisation"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bvn Staff Login".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Organisation".to_s, :count => 2
  end
end
