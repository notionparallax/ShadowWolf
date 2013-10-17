require "spec_helper"

describe PersonContactsController do
  describe "routing" do

    it "routes to #index" do
      get("/person_contacts").should route_to("person_contacts#index")
    end

    it "routes to #new" do
      get("/person_contacts/new").should route_to("person_contacts#new")
    end

    it "routes to #show" do
      get("/person_contacts/1").should route_to("person_contacts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/person_contacts/1/edit").should route_to("person_contacts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/person_contacts").should route_to("person_contacts#create")
    end

    it "routes to #update" do
      put("/person_contacts/1").should route_to("person_contacts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/person_contacts/1").should route_to("person_contacts#destroy", :id => "1")
    end

  end
end
