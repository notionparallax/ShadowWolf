require "spec_helper"

describe SecurityClearancesController do
  describe "routing" do

    it "routes to #index" do
      get("/security_clearances").should route_to("security_clearances#index")
    end

    it "routes to #new" do
      get("/security_clearances/new").should route_to("security_clearances#new")
    end

    it "routes to #show" do
      get("/security_clearances/1").should route_to("security_clearances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/security_clearances/1/edit").should route_to("security_clearances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/security_clearances").should route_to("security_clearances#create")
    end

    it "routes to #update" do
      put("/security_clearances/1").should route_to("security_clearances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/security_clearances/1").should route_to("security_clearances#destroy", :id => "1")
    end

  end
end
