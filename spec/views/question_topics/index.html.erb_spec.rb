require 'spec_helper'

describe "question_topics/index" do
  before(:each) do
    assign(:question_topics, [
      stub_model(QuestionTopic,
        :topic => nil,
        :question => nil
      ),
      stub_model(QuestionTopic,
        :topic => nil,
        :question => nil
      )
    ])
  end

  it "renders a list of question_topics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
