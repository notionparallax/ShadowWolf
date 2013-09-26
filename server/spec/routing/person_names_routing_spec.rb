require "spec_helper"

describe PersonNamesController do
  describe "routing" do

    it "routes to #index" do
      get("/person_names").should route_to("person_names#index")
    end

    it "routes to #new" do
      get("/person_names/new").should route_to("person_names#new")
    end

    it "routes to #show" do
      get("/person_names/1").should route_to("person_names#show", :id => "1")
    end

    it "routes to #edit" do
      get("/person_names/1/edit").should route_to("person_names#edit", :id => "1")
    end

    it "routes to #create" do
      post("/person_names").should route_to("person_names#create")
    end

    it "routes to #update" do
      put("/person_names/1").should route_to("person_names#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/person_names/1").should route_to("person_names#destroy", :id => "1")
    end

  end
end
