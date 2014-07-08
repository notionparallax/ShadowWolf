require 'spec_helper'

describe "config/people/show" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Employee,
      :login => "Login",
      :position => "Position",
      :skills_update_link => "Skills Update Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Login/)
    rendered.should match(/Position/)
    rendered.should match(/Skills Update Link/)
  end
end
