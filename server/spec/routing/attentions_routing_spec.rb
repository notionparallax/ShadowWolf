require "spec_helper"

describe AttentionsController do
  describe "routing" do

    it "routes to #index" do
      get("/attentions").should route_to("attentions#index")
    end

    it "routes to #new" do
      get("/attentions/new").should route_to("attentions#new")
    end

    it "routes to #show" do
      get("/attentions/1").should route_to("attentions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/attentions/1/edit").should route_to("attentions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/attentions").should route_to("attentions#create")
    end

    it "routes to #update" do
      put("/attentions/1").should route_to("attentions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/attentions/1").should route_to("attentions#destroy", :id => "1")
    end

  end
end
