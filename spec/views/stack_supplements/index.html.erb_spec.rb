require 'spec_helper'

describe "stack_supplements/index" do
  before(:each) do
    assign(:stack_supplements, [
      stub_model(StackSupplement,
        :stack => nil,
        :supplement => nil,
        :frequency => nil,
        :dose => "Dose"
      ),
      stub_model(StackSupplement,
        :stack => nil,
        :supplement => nil,
        :frequency => nil,
        :dose => "Dose"
      )
    ])
  end

  it "renders a list of stack_supplements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Dose".to_s, :count => 2
  end
end
