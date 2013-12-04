require 'spec_helper'

describe "PersonalAwards" do
  describe "GET /personal_awards" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get personal_awards_path
      response.status.should be(200)
    end
  end
end
