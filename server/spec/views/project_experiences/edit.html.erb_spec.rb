require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(ProjectExperience,
      :name => "MyString",
      :firm => "MyString",
      :role => "MyString",
      :stage => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "input#config_model_name[name=?]", "config_model[name]"
      assert_select "input#config_model_firm[name=?]", "config_model[firm]"
      assert_select "input#config_model_role[name=?]", "config_model[role]"
      assert_select "input#config_model_stage[name=?]", "config_model[stage]"
      assert_select "input#config_model_url[name=?]", "config_model[url]"
    end
  end
end
