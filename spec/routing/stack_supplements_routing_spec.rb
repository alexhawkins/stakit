require "spec_helper"

describe StackSupplementsController do
  describe "routing" do

    it "routes to #index" do
      get("/stack_supplements").should route_to("stack_supplements#index")
    end

    it "routes to #new" do
      get("/stack_supplements/new").should route_to("stack_supplements#new")
    end

    it "routes to #show" do
      get("/stack_supplements/1").should route_to("stack_supplements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stack_supplements/1/edit").should route_to("stack_supplements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stack_supplements").should route_to("stack_supplements#create")
    end

    it "routes to #update" do
      put("/stack_supplements/1").should route_to("stack_supplements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stack_supplements/1").should route_to("stack_supplements#destroy", :id => "1")
    end

  end
end
