require "spec_helper"

describe UserAttachmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_attachments").should route_to("user_attachments#index")
    end

    it "routes to #new" do
      get("/user_attachments/new").should route_to("user_attachments#new")
    end

    it "routes to #show" do
      get("/user_attachments/1").should route_to("user_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_attachments/1/edit").should route_to("user_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_attachments").should route_to("user_attachments#create")
    end

    it "routes to #update" do
      put("/user_attachments/1").should route_to("user_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_attachments/1").should route_to("user_attachments#destroy", :id => "1")
    end

  end
end
