require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe QuestionTopicsController do

  # This should return the minimal set of attributes required to create a valid
  # QuestionTopic. As you add validations to QuestionTopic, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "topic" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # QuestionTopicsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all question_topics as @question_topics" do
      question_topic = QuestionTopic.create! valid_attributes
      get :index, {}, valid_session
      assigns(:question_topics).should eq([question_topic])
    end
  end

  describe "GET show" do
    it "assigns the requested question_topic as @question_topic" do
      question_topic = QuestionTopic.create! valid_attributes
      get :show, {:id => question_topic.to_param}, valid_session
      assigns(:question_topic).should eq(question_topic)
    end
  end

  describe "GET new" do
    it "assigns a new question_topic as @question_topic" do
      get :new, {}, valid_session
      assigns(:question_topic).should be_a_new(QuestionTopic)
    end
  end

  describe "GET edit" do
    it "assigns the requested question_topic as @question_topic" do
      question_topic = QuestionTopic.create! valid_attributes
      get :edit, {:id => question_topic.to_param}, valid_session
      assigns(:question_topic).should eq(question_topic)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new QuestionTopic" do
        expect {
          post :create, {:question_topic => valid_attributes}, valid_session
        }.to change(QuestionTopic, :count).by(1)
      end

      it "assigns a newly created question_topic as @question_topic" do
        post :create, {:question_topic => valid_attributes}, valid_session
        assigns(:question_topic).should be_a(QuestionTopic)
        assigns(:question_topic).should be_persisted
      end

      it "redirects to the created question_topic" do
        post :create, {:question_topic => valid_attributes}, valid_session
        response.should redirect_to(QuestionTopic.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved question_topic as @question_topic" do
        # Trigger the behavior that occurs when invalid params are submitted
        QuestionTopic.any_instance.stub(:save).and_return(false)
        post :create, {:question_topic => { "topic" => "invalid value" }}, valid_session
        assigns(:question_topic).should be_a_new(QuestionTopic)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        QuestionTopic.any_instance.stub(:save).and_return(false)
        post :create, {:question_topic => { "topic" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested question_topic" do
        question_topic = QuestionTopic.create! valid_attributes
        # Assuming there are no other question_topics in the database, this
        # specifies that the QuestionTopic created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        QuestionTopic.any_instance.should_receive(:update).with({ "topic" => "" })
        put :update, {:id => question_topic.to_param, :question_topic => { "topic" => "" }}, valid_session
      end

      it "assigns the requested question_topic as @question_topic" do
        question_topic = QuestionTopic.create! valid_attributes
        put :update, {:id => question_topic.to_param, :question_topic => valid_attributes}, valid_session
        assigns(:question_topic).should eq(question_topic)
      end

      it "redirects to the question_topic" do
        question_topic = QuestionTopic.create! valid_attributes
        put :update, {:id => question_topic.to_param, :question_topic => valid_attributes}, valid_session
        response.should redirect_to(question_topic)
      end
    end

    describe "with invalid params" do
      it "assigns the question_topic as @question_topic" do
        question_topic = QuestionTopic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        QuestionTopic.any_instance.stub(:save).and_return(false)
        put :update, {:id => question_topic.to_param, :question_topic => { "topic" => "invalid value" }}, valid_session
        assigns(:question_topic).should eq(question_topic)
      end

      it "re-renders the 'edit' template" do
        question_topic = QuestionTopic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        QuestionTopic.any_instance.stub(:save).and_return(false)
        put :update, {:id => question_topic.to_param, :question_topic => { "topic" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested question_topic" do
      question_topic = QuestionTopic.create! valid_attributes
      expect {
        delete :destroy, {:id => question_topic.to_param}, valid_session
      }.to change(QuestionTopic, :count).by(-1)
    end

    it "redirects to the question_topics list" do
      question_topic = QuestionTopic.create! valid_attributes
      delete :destroy, {:id => question_topic.to_param}, valid_session
      response.should redirect_to(question_topics_url)
    end
  end

end
