require 'spec_helper'

describe "DimensionGroups" do
  describe "GET /dimension_groups" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get dimension_groups_path
      response.status.should be(200)
    end
  end
end
