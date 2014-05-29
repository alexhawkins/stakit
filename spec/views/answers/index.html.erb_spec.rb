require 'spec_helper'

describe "answers/index" do
  before(:each) do
    assign(:answers, [
      stub_model(Answer,
        :user => nil,
        :question => nil,
        :body => "Body"
      ),
      stub_model(Answer,
        :user => nil,
        :question => nil,
        :body => "Body"
      )
    ])
  end

  it "renders a list of answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
