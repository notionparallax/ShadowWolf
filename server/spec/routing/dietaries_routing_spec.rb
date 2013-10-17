require "spec_helper"

describe DietariesController do
  describe "routing" do

    it "routes to #index" do
      get("/dietaries").should route_to("dietaries#index")
    end

    it "routes to #new" do
      get("/dietaries/new").should route_to("dietaries#new")
    end

    it "routes to #show" do
      get("/dietaries/1").should route_to("dietaries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dietaries/1/edit").should route_to("dietaries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dietaries").should route_to("dietaries#create")
    end

    it "routes to #update" do
      put("/dietaries/1").should route_to("dietaries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dietaries/1").should route_to("dietaries#destroy", :id => "1")
    end

  end
end
