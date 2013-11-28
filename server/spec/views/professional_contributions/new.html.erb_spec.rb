require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(ProfessionalContribution,
      :activity => "MyString",
      :description => "MyText",
      :url => "MyString",
      :date => "MyString"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", professional_contributions_path, "post" do
      assert_select "input#config_model_activity[name=?]", "config_model[activity]"
      assert_select "textarea#config_model_description[name=?]", "config_model[description]"
      assert_select "input#config_model_url[name=?]", "config_model[url]"
      assert_select "input#config_model_date[name=?]", "config_model[date]"
    end
  end
end
