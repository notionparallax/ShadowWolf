require "spec_helper"

describe FrequentFlierProgramsController do
  describe "routing" do

    it "routes to #index" do
      get("/frequent_flier_programs").should route_to("frequent_flier_programs#index")
    end

    it "routes to #new" do
      get("/frequent_flier_programs/new").should route_to("frequent_flier_programs#new")
    end

    it "routes to #show" do
      get("/frequent_flier_programs/1").should route_to("frequent_flier_programs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/frequent_flier_programs/1/edit").should route_to("frequent_flier_programs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/frequent_flier_programs").should route_to("frequent_flier_programs#create")
    end

    it "routes to #update" do
      put("/frequent_flier_programs/1").should route_to("frequent_flier_programs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/frequent_flier_programs/1").should route_to("frequent_flier_programs#destroy", :id => "1")
    end

  end
end
