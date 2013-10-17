require 'spec_helper'

describe "professional_contributions/new" do
  before(:each) do
    assign(:professional_contribution, stub_model(ProfessionalContribution,
      :activity => "MyString",
      :description => "MyText",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new professional_contribution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", professional_contributions_path, "post" do
      assert_select "input#professional_contribution_activity[name=?]", "professional_contribution[activity]"
      assert_select "textarea#professional_contribution_description[name=?]", "professional_contribution[description]"
      assert_select "input#professional_contribution_url[name=?]", "professional_contribution[url]"
    end
  end
end
