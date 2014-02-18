require 'spec_helper'

describe "GrossBuildingAreas" do
  describe "GET /gross_building_areas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get gross_building_areas_path
      response.status.should be(200)
    end
  end
end
