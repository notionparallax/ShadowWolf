require "spec_helper"

describe OfficeCulturesController do
  describe "routing" do

    it "routes to #index" do
      get("/office_cultures").should route_to("office_cultures#index")
    end

    it "routes to #new" do
      get("/office_cultures/new").should route_to("office_cultures#new")
    end

    it "routes to #show" do
      get("/office_cultures/1").should route_to("office_cultures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/office_cultures/1/edit").should route_to("office_cultures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/office_cultures").should route_to("office_cultures#create")
    end

    it "routes to #update" do
      put("/office_cultures/1").should route_to("office_cultures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/office_cultures/1").should route_to("office_cultures#destroy", :id => "1")
    end

  end
end
