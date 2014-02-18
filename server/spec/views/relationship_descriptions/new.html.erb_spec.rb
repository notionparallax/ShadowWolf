require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(RelationshipDescription,
      :client => "MyText",
      :stakeholder => "MyText",
      :councils => "MyText"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", relationship_descriptions_path, "post" do
      assert_select "textarea#config_project_client[name=?]", "config_project[client]"
      assert_select "textarea#config_project_stakeholder[name=?]", "config_project[stakeholder]"
      assert_select "textarea#config_project_councils[name=?]", "config_project[councils]"
    end
  end
end
