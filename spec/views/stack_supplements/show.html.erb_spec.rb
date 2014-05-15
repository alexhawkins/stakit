require 'spec_helper'

describe "stack_supplements/show" do
  before(:each) do
    @stack_supplement = assign(:stack_supplement, stub_model(StackSupplement,
      :stack => nil,
      :supplement => nil,
      :frequency => nil,
      :dose => "Dose"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Dose/)
  end
end
