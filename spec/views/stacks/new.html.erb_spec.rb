require 'spec_helper'

describe "stacks/new" do
  before(:each) do
    assign(:stack, stub_model(Stack,
      :name => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new stack form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stacks_path, "post" do
      assert_select "input#stack_name[name=?]", "stack[name]"
      assert_select "input#stack_user[name=?]", "stack[user]"
    end
  end
end
