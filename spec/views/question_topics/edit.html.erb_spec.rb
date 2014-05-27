require 'spec_helper'

describe "question_topics/edit" do
  before(:each) do
    @question_topic = assign(:question_topic, stub_model(QuestionTopic,
      :topic => nil,
      :question => nil
    ))
  end

  it "renders the edit question_topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_topic_path(@question_topic), "post" do
      assert_select "input#question_topic_topic[name=?]", "question_topic[topic]"
      assert_select "input#question_topic_question[name=?]", "question_topic[question]"
    end
  end
end
