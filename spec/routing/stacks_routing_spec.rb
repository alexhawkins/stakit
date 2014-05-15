require "spec_helper"

describe StacksController do
  describe "routing" do

    it "routes to #index" do
      get("/stacks").should route_to("stacks#index")
    end

    it "routes to #new" do
      get("/stacks/new").should route_to("stacks#new")
    end

    it "routes to #show" do
      get("/stacks/1").should route_to("stacks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stacks/1/edit").should route_to("stacks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stacks").should route_to("stacks#create")
    end

    it "routes to #update" do
      put("/stacks/1").should route_to("stacks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stacks/1").should route_to("stacks#destroy", :id => "1")
    end

  end
end
