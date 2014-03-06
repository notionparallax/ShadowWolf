require 'spec_helper'

describe "EmployeePresses" do
  describe "GET /employee_presses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get employee_presses_path
      response.status.should be(200)
    end
  end
end
