require 'spec_helper'

describe "config/models/edit" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(EmployeeMobile,
      :number => "MyString",
      :is_work => false,
      :distribute => false
    ))
  end

  it "renders the edit config_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_model_path(@config_model), "post" do
      assert_select "input#config_model_number[name=?]", "config_model[number]"
      assert_select "input#config_model_is_work[name=?]", "config_model[is_work]"
      assert_select "input#config_model_distribute[name=?]", "config_model[distribute]"
    end
  end
end
