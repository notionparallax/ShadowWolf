require 'spec_helper'

describe "config/people/edit" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Passport,
      :number => "MyString",
      :issuing_body => "MyString"
    ))
  end

  it "renders the edit config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_person_path(@config_person), "post" do
      assert_select "input#config_person_number[name=?]", "config_person[number]"
      assert_select "input#config_person_issuing_body[name=?]", "config_person[issuing_body]"
    end
  end
end
