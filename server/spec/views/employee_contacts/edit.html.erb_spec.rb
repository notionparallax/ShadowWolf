require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(EmployeeContact,
      :extension => "MyString",
      :studio => "MyString",
      :work_email => "MyString"
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "input#config_model_extension[name=?]", "config_model[extension]"
      assert_select "input#config_model_studio[name=?]", "config_model[studio]"
      assert_select "input#config_model_work_email[name=?]", "config_model[work_email]"
    end
  end
end
