require 'spec_helper'

describe "QualityAssurances" do
  describe "GET /quality_assurances" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get quality_assurances_path
      response.status.should be(200)
    end
  end
end
