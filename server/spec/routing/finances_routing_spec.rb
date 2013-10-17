require "spec_helper"

describe FinancesController do
  describe "routing" do

    it "routes to #index" do
      get("/finances").should route_to("finances#index")
    end

    it "routes to #new" do
      get("/finances/new").should route_to("finances#new")
    end

    it "routes to #show" do
      get("/finances/1").should route_to("finances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/finances/1/edit").should route_to("finances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/finances").should route_to("finances#create")
    end

    it "routes to #update" do
      put("/finances/1").should route_to("finances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/finances/1").should route_to("finances#destroy", :id => "1")
    end

  end
end
