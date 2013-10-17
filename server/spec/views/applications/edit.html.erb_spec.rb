require 'spec_helper'

describe "applications/edit" do
  before(:each) do
    @application = assign(:application, stub_model(Application,
      :covering_letter => "MyString",
      :portfolio => "MyString",
      :assessment => "MyText",
      :future_consideration => false,
      :skills_and_keywords => "MyText"
    ))
  end

  it "renders the edit application form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", application_path(@application), "post" do
      assert_select "input#application_covering_letter[name=?]", "application[covering_letter]"
      assert_select "input#application_portfolio[name=?]", "application[portfolio]"
      assert_select "textarea#application_assessment[name=?]", "application[assessment]"
      assert_select "input#application_future_consideration[name=?]", "application[future_consideration]"
      assert_select "textarea#application_skills_and_keywords[name=?]", "application[skills_and_keywords]"
    end
  end
end
