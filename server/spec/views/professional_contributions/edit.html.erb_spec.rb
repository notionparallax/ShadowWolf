require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(ProfessionalContribution,
      :activity => "MyString",
      :description => "MyText",
      :url => "MyString",
      :date => "MyString"
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_activity[name=?]", "config_person[activity]"
      assert_select "textarea#config_person_description[name=?]", "config_person[description]"
      assert_select "input#config_person_url[name=?]", "config_person[url]"
      assert_select "input#config_person_date[name=?]", "config_person[date]"
    end
  end
end
