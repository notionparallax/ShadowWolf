require 'spec_helper'

describe "dietaries/new" do
  before(:each) do
    assign(:dietary, stub_model(Dietary,
      :requirements => "MyText"
    ).as_new_record)
  end

  it "renders new dietary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dietaries_path, "post" do
      assert_select "textarea#dietary_requirements[name=?]", "dietary[requirements]"
    end
  end
end
