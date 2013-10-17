require 'spec_helper'

describe "office_cultures/edit" do
  before(:each) do
    @office_culture = assign(:office_culture, stub_model(OfficeCulture,
      :first_aider => false,
      :fire_warden => false
    ))
  end

  it "renders the edit office_culture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", office_culture_path(@office_culture), "post" do
      assert_select "input#office_culture_first_aider[name=?]", "office_culture[first_aider]"
      assert_select "input#office_culture_fire_warden[name=?]", "office_culture[fire_warden]"
    end
  end
end
