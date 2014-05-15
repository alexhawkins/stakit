require "spec_helper"

describe FrenquenciesController do
  describe "routing" do

    it "routes to #index" do
      get("/frenquencies").should route_to("frenquencies#index")
    end

    it "routes to #new" do
      get("/frenquencies/new").should route_to("frenquencies#new")
    end

    it "routes to #show" do
      get("/frenquencies/1").should route_to("frenquencies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/frenquencies/1/edit").should route_to("frenquencies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/frenquencies").should route_to("frenquencies#create")
    end

    it "routes to #update" do
      put("/frenquencies/1").should route_to("frenquencies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/frenquencies/1").should route_to("frenquencies#destroy", :id => "1")
    end

  end
end
