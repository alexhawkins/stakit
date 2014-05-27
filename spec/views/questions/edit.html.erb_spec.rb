require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_path(@question), "post" do
      assert_select "input#question_name[name=?]", "question[name]"
      assert_select "input#question_description[name=?]", "question[description]"
    end
  end
end
