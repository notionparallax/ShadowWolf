require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Employee,
      :login => "MyString",
      :position => "MyString"
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_login[name=?]", "config_person[login]"
      assert_select "input#config_person_position[name=?]", "config_person[position]"
    end
  end
end
