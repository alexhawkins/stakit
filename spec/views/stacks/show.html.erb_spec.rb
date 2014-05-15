require 'spec_helper'

describe "stacks/show" do
  before(:each) do
    @stack = assign(:stack, stub_model(Stack,
      :name => "Name",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
