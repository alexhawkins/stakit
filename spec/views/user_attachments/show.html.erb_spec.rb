require 'spec_helper'

describe "user_attachments/show" do
  before(:each) do
    @user_attachment = assign(:user_attachment, stub_model(UserAttachment,
      :user_id => 1,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Image/)
  end
end
