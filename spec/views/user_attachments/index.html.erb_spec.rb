require 'spec_helper'

describe "user_attachments/index" do
  before(:each) do
    assign(:user_attachments, [
      stub_model(UserAttachment,
        :user_id => 1,
        :image => "Image"
      ),
      stub_model(UserAttachment,
        :user_id => 1,
        :image => "Image"
      )
    ])
  end

  it "renders a list of user_attachments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
