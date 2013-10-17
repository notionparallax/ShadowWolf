require "spec_helper"

describe EmployeeMobilesController do
  describe "routing" do

    it "routes to #index" do
      get("/employee_mobiles").should route_to("employee_mobiles#index")
    end

    it "routes to #new" do
      get("/employee_mobiles/new").should route_to("employee_mobiles#new")
    end

    it "routes to #show" do
      get("/employee_mobiles/1").should route_to("employee_mobiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employee_mobiles/1/edit").should route_to("employee_mobiles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employee_mobiles").should route_to("employee_mobiles#create")
    end

    it "routes to #update" do
      put("/employee_mobiles/1").should route_to("employee_mobiles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employee_mobiles/1").should route_to("employee_mobiles#destroy", :id => "1")
    end

  end
end
