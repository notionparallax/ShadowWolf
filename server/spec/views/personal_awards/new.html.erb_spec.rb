require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(PersonalAward,
      :name => "MyString",
      :awarding_body => "MyString",
      :description => "MyText",
      :url => "MyString",
      :year_achieved => 1
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", personal_awards_path, "post" do
      assert_select "input#config_model_name[name=?]", "config_model[name]"
      assert_select "input#config_model_awarding_body[name=?]", "config_model[awarding_body]"
      assert_select "textarea#config_model_description[name=?]", "config_model[description]"
      assert_select "input#config_model_url[name=?]", "config_model[url]"
      assert_select "input#config_model_year_achieved[name=?]", "config_model[year_achieved]"
    end
  end
end
