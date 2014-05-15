require 'spec_helper'

describe "stacks/edit" do
  before(:each) do
    @stack = assign(:stack, stub_model(Stack,
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit stack form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stack_path(@stack), "post" do
      assert_select "input#stack_name[name=?]", "stack[name]"
      assert_select "input#stack_user[name=?]", "stack[user]"
    end
  end
end
