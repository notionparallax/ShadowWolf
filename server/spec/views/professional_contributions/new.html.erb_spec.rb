require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(ProfessionalContribution,
      :activity => "MyString",
      :description => "MyText",
      :url => "MyString",
      :date => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", professional_contributions_path, "post" do
      assert_select "input#config_person_activity[name=?]", "config_person[activity]"
      assert_select "textarea#config_person_description[name=?]", "config_person[description]"
      assert_select "input#config_person_url[name=?]", "config_person[url]"
      assert_select "input#config_person_date[name=?]", "config_person[date]"
    end
  end
end
