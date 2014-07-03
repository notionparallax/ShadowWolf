require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :login => "Login",
        :position => "Position",
        :skills_update_link => "Skills Update Link"
      ),
      stub_model(Employee,
        :login => "Login",
        :position => "Position",
        :skills_update_link => "Skills Update Link"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
    assert_select "tr>td", :text => "Skills Update Link".to_s, :count => 2
  end
end
