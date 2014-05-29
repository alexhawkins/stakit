require 'spec_helper'

describe "answers/edit" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :user => nil,
      :question => nil,
      :body => "MyString"
    ))
  end

  it "renders the edit answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do
      assert_select "input#answer_user[name=?]", "answer[user]"
      assert_select "input#answer_question[name=?]", "answer[question]"
      assert_select "input#answer_body[name=?]", "answer[body]"
    end
  end
end
