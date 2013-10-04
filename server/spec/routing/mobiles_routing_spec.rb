require "spec_helper"

describe MobilesController do
  describe "routing" do

    it "routes to #index" do
      get("/mobiles").should route_to("mobiles#index")
    end

    it "routes to #new" do
      get("/mobiles/new").should route_to("mobiles#new")
    end

    it "routes to #show" do
      get("/mobiles/1").should route_to("mobiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mobiles/1/edit").should route_to("mobiles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mobiles").should route_to("mobiles#create")
    end

    it "routes to #update" do
      put("/mobiles/1").should route_to("mobiles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mobiles/1").should route_to("mobiles#destroy", :id => "1")
    end

  end
end
