require "spec_helper"

describe SupplementsController do
  describe "routing" do

    it "routes to #index" do
      get("/supplements").should route_to("supplements#index")
    end

    it "routes to #new" do
      get("/supplements/new").should route_to("supplements#new")
    end

    it "routes to #show" do
      get("/supplements/1").should route_to("supplements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supplements/1/edit").should route_to("supplements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supplements").should route_to("supplements#create")
    end

    it "routes to #update" do
      put("/supplements/1").should route_to("supplements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supplements/1").should route_to("supplements#destroy", :id => "1")
    end

  end
end
