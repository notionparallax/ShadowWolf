require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(ProfessionalContribution,
      :activity => "MyString",
      :description => "MyText",
      :url => "MyString"
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "input#config_model_activity[name=?]", "config_model[activity]"
      assert_select "textarea#config_model_description[name=?]", "config_model[description]"
      assert_select "input#config_model_url[name=?]", "config_model[url]"
    end
  end
end
