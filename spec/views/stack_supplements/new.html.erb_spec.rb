require 'spec_helper'

describe "stack_supplements/new" do
  before(:each) do
    assign(:stack_supplement, stub_model(StackSupplement,
      :stack => nil,
      :supplement => nil,
      :frequency => nil,
      :dose => "MyString"
    ).as_new_record)
  end

  it "renders new stack_supplement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stack_supplements_path, "post" do
      assert_select "input#stack_supplement_stack[name=?]", "stack_supplement[stack]"
      assert_select "input#stack_supplement_supplement[name=?]", "stack_supplement[supplement]"
      assert_select "input#stack_supplement_frequency[name=?]", "stack_supplement[frequency]"
      assert_select "input#stack_supplement_dose[name=?]", "stack_supplement[dose]"
    end
  end
end
