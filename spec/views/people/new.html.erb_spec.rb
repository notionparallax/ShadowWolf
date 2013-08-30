require 'spec_helper'

describe "people/new" do
  before(:each) do
    assign(:person, stub_model(Person).as_new_record)
  end

  it "renders new person form" do
    render

    rendered.should have_selector("form", :action => people_path, :method => "post") do |form|
    end
  end
end
