require "spec_helper"

describe PersonalAwardsController do
  describe "routing" do

    it "routes to #index" do
      get("/personal_awards").should route_to("personal_awards#index")
    end

    it "routes to #new" do
      get("/personal_awards/new").should route_to("personal_awards#new")
    end

    it "routes to #show" do
      get("/personal_awards/1").should route_to("personal_awards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/personal_awards/1/edit").should route_to("personal_awards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/personal_awards").should route_to("personal_awards#create")
    end

    it "routes to #update" do
      put("/personal_awards/1").should route_to("personal_awards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/personal_awards/1").should route_to("personal_awards#destroy", :id => "1")
    end

  end
end
