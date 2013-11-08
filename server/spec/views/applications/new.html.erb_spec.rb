require 'spec_helper'

describe "config/models/new" do
  before(:each) do
    assign(:config_model, stub_model(Application,
      :covering_letter => "MyString",
      :portfolio => "MyString",
      :assessment => "MyText",
      :future_consideration => false,
      :skills_and_keywords => "MyText"
    ).as_new_record)
  end

  it "renders new config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", applications_path, "post" do
      assert_select "input#config_model_covering_letter[name=?]", "config_model[covering_letter]"
      assert_select "input#config_model_portfolio[name=?]", "config_model[portfolio]"
      assert_select "textarea#config_model_assessment[name=?]", "config_model[assessment]"
      assert_select "input#config_model_future_consideration[name=?]", "config_model[future_consideration]"
      assert_select "textarea#config_model_skills_and_keywords[name=?]", "config_model[skills_and_keywords]"
    end
  end
end
