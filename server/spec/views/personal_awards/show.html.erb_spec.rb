require 'spec_helper'

describe "personal_awards/show" do
  before(:each) do
    @personal_award = assign(:personal_award, stub_model(PersonalAward,
      :name => "Name",
      :awarding_body => "Awarding Body",
      :description => "MyText",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Awarding Body/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
  end
end
