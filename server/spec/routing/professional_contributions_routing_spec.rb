require "spec_helper"

describe ProfessionalContributionsController do
  describe "routing" do

    it "routes to #index" do
      get("/professional_contributions").should route_to("professional_contributions#index")
    end

    it "routes to #new" do
      get("/professional_contributions/new").should route_to("professional_contributions#new")
    end

    it "routes to #show" do
      get("/professional_contributions/1").should route_to("professional_contributions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/professional_contributions/1/edit").should route_to("professional_contributions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/professional_contributions").should route_to("professional_contributions#create")
    end

    it "routes to #update" do
      put("/professional_contributions/1").should route_to("professional_contributions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/professional_contributions/1").should route_to("professional_contributions#destroy", :id => "1")
    end

  end
end
