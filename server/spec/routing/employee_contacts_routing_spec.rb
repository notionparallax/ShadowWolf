require "spec_helper"

describe EmployeeContactsController do
  describe "routing" do

    it "routes to #index" do
      get("/employee_contacts").should route_to("employee_contacts#index")
    end

    it "routes to #new" do
      get("/employee_contacts/new").should route_to("employee_contacts#new")
    end

    it "routes to #show" do
      get("/employee_contacts/1").should route_to("employee_contacts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employee_contacts/1/edit").should route_to("employee_contacts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employee_contacts").should route_to("employee_contacts#create")
    end

    it "routes to #update" do
      put("/employee_contacts/1").should route_to("employee_contacts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employee_contacts/1").should route_to("employee_contacts#destroy", :id => "1")
    end

  end
end
