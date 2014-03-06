require 'spec_helper'

describe "config/people/show" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(ProfessionalContribution,
      :activity => "Activity",
      :description => "MyText",
      :url => "Url",
      :date => "Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Activity/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/Date/)
  end
end
