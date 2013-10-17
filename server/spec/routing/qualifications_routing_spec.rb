require "spec_helper"

describe QualificationsController do
  describe "routing" do

    it "routes to #index" do
      get("/qualifications").should route_to("qualifications#index")
    end

    it "routes to #new" do
      get("/qualifications/new").should route_to("qualifications#new")
    end

    it "routes to #show" do
      get("/qualifications/1").should route_to("qualifications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/qualifications/1/edit").should route_to("qualifications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/qualifications").should route_to("qualifications#create")
    end

    it "routes to #update" do
      put("/qualifications/1").should route_to("qualifications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/qualifications/1").should route_to("qualifications#destroy", :id => "1")
    end

  end
end
