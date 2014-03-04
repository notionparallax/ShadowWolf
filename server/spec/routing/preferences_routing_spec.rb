require "spec_helper"

describe PreferencesController do
  describe "routing" do

    it "routes to #index" do
      get("/config/people").should route_to("config/people#index")
    end

    it "routes to #new" do
      get("/config/people/new").should route_to("config/people#new")
    end

    it "routes to #show" do
      get("/config/people/1").should route_to("config/people#show", :id => "1")
    end

    it "routes to #edit" do
      get("/config/people/1/edit").should route_to("config/people#edit", :id => "1")
    end

    it "routes to #create" do
      post("/config/people").should route_to("config/people#create")
    end

    it "routes to #update" do
      put("/config/people/1").should route_to("config/people#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/config/people/1").should route_to("config/people#destroy", :id => "1")
    end

  end
end
