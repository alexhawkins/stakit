require "spec_helper"

describe QuestionTopicsController do
  describe "routing" do

    it "routes to #index" do
      get("/question_topics").should route_to("question_topics#index")
    end

    it "routes to #new" do
      get("/question_topics/new").should route_to("question_topics#new")
    end

    it "routes to #show" do
      get("/question_topics/1").should route_to("question_topics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/question_topics/1/edit").should route_to("question_topics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/question_topics").should route_to("question_topics#create")
    end

    it "routes to #update" do
      put("/question_topics/1").should route_to("question_topics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/question_topics/1").should route_to("question_topics#destroy", :id => "1")
    end

  end
end
