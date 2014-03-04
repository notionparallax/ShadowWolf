require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(EmployeeMobile,
      :number => "MyString",
      :is_work => false,
      :distribute => false
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_number[name=?]", "config_person[number]"
      assert_select "input#config_person_is_work[name=?]", "config_person[is_work]"
      assert_select "input#config_person_distribute[name=?]", "config_person[distribute]"
    end
  end
end
