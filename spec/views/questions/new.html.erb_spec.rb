require 'spec_helper'

describe "questions/new" do
  before(:each) do
    assign(:question, stub_model(Question,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", questions_path, "post" do
      assert_select "input#question_name[name=?]", "question[name]"
      assert_select "input#question_description[name=?]", "question[description]"
    end
  end
end
