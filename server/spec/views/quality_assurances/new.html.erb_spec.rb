require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(QualityAssurance,
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quality_assurances_path, "post" do
      assert_select "textarea#config_project_notes[name=?]", "config_project[notes]"
    end
  end
end
