require "spec_helper"

describe PassportsController do
  describe "routing" do

    it "routes to #index" do
      get("/passports").should route_to("passports#index")
    end

    it "routes to #new" do
      get("/passports/new").should route_to("passports#new")
    end

    it "routes to #show" do
      get("/passports/1").should route_to("passports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/passports/1/edit").should route_to("passports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/passports").should route_to("passports#create")
    end

    it "routes to #update" do
      put("/passports/1").should route_to("passports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/passports/1").should route_to("passports#destroy", :id => "1")
    end

  end
end
