require 'spec_helper'

describe "dietaries/edit" do
  before(:each) do
    @dietary = assign(:dietary, stub_model(Dietary,
      :requirements => "MyText"
    ))
  end

  it "renders the edit dietary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dietary_path(@dietary), "post" do
      assert_select "textarea#dietary_requirements[name=?]", "dietary[requirements]"
    end
  end
end
