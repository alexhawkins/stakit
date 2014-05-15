require 'spec_helper'

describe "stack_supplements/edit" do
  before(:each) do
    @stack_supplement = assign(:stack_supplement, stub_model(StackSupplement,
      :stack => nil,
      :supplement => nil,
      :frequency => nil,
      :dose => "MyString"
    ))
  end

  it "renders the edit stack_supplement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stack_supplement_path(@stack_supplement), "post" do
      assert_select "input#stack_supplement_stack[name=?]", "stack_supplement[stack]"
      assert_select "input#stack_supplement_supplement[name=?]", "stack_supplement[supplement]"
      assert_select "input#stack_supplement_frequency[name=?]", "stack_supplement[frequency]"
      assert_select "input#stack_supplement_dose[name=?]", "stack_supplement[dose]"
    end
  end
end
