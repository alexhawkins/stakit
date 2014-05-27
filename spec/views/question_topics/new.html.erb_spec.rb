require 'spec_helper'

describe "question_topics/new" do
  before(:each) do
    assign(:question_topic, stub_model(QuestionTopic,
      :topic => nil,
      :question => nil
    ).as_new_record)
  end

  it "renders new question_topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_topics_path, "post" do
      assert_select "input#question_topic_topic[name=?]", "question_topic[topic]"
      assert_select "input#question_topic_question[name=?]", "question_topic[question]"
    end
  end
end
