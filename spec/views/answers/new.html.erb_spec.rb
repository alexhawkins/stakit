require 'spec_helper'

describe "answers/new" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :user => nil,
      :question => nil,
      :body => "MyString"
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answers_path, "post" do
      assert_select "input#answer_user[name=?]", "answer[user]"
      assert_select "input#answer_question[name=?]", "answer[question]"
      assert_select "input#answer_body[name=?]", "answer[body]"
    end
  end
end
