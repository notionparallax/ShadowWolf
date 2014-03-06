require "spec_helper"

describe TestimonialsController do
  describe "routing" do

    it "routes to #index" do
      get("/config/projects").should route_to("config/projects#index")
    end

    it "routes to #new" do
      get("/config/projects/new").should route_to("config/projects#new")
    end

    it "routes to #show" do
      get("/config/projects/1").should route_to("config/projects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/config/projects/1/edit").should route_to("config/projects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/config/projects").should route_to("config/projects#create")
    end

    it "routes to #update" do
      put("/config/projects/1").should route_to("config/projects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/config/projects/1").should route_to("config/projects#destroy", :id => "1")
    end

  end
end
