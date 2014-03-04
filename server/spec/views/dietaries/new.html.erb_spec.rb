require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(Dietary,
      :requirements => "MyText"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dietaries_path, "post" do
      assert_select "textarea#config_person_requirements[name=?]", "config_person[requirements]"
    end
  end
end
