require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(Employee,
      :login => "MyString",
      :position => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employees_path, "post" do
      assert_select "input#config_person_login[name=?]", "config_person[login]"
      assert_select "input#config_person_position[name=?]", "config_person[position]"
    end
  end
end
