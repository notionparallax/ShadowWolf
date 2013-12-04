require "spec_helper"

describe ConditionsController do
  describe "routing" do

    it "routes to #index" do
      get("/config/models").should route_to("config/models#index")
    end

    it "routes to #new" do
      get("/config/models/new").should route_to("config/models#new")
    end

    it "routes to #show" do
      get("/config/models/1").should route_to("config/models#show", :id => "1")
    end

    it "routes to #edit" do
      get("/config/models/1/edit").should route_to("config/models#edit", :id => "1")
    end

    it "routes to #create" do
      post("/config/models").should route_to("config/models#create")
    end

    it "routes to #update" do
      put("/config/models/1").should route_to("config/models#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/config/models/1").should route_to("config/models#destroy", :id => "1")
    end

  end
end
