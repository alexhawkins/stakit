require 'spec_helper'

describe "question_topics/show" do
  before(:each) do
    @question_topic = assign(:question_topic, stub_model(QuestionTopic,
      :topic => nil,
      :question => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
