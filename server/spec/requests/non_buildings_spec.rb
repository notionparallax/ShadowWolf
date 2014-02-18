require 'spec_helper'

describe "NonBuildings" do
  describe "GET /non_buildings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get non_buildings_path
      response.status.should be(200)
    end
  end
end
