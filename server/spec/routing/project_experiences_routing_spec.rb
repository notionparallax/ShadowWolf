require "spec_helper"

describe ProjectExperiencesController do
  describe "routing" do

    it "routes to #index" do
      get("/project_experiences").should route_to("project_experiences#index")
    end

    it "routes to #new" do
      get("/project_experiences/new").should route_to("project_experiences#new")
    end

    it "routes to #show" do
      get("/project_experiences/1").should route_to("project_experiences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/project_experiences/1/edit").should route_to("project_experiences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/project_experiences").should route_to("project_experiences#create")
    end

    it "routes to #update" do
      put("/project_experiences/1").should route_to("project_experiences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/project_experiences/1").should route_to("project_experiences#destroy", :id => "1")
    end

  end
end
