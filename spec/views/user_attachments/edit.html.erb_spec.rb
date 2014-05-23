require 'spec_helper'

describe "user_attachments/edit" do
  before(:each) do
    @user_attachment = assign(:user_attachment, stub_model(UserAttachment,
      :user_id => 1,
      :image => "MyString"
    ))
  end

  it "renders the edit user_attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_attachment_path(@user_attachment), "post" do
      assert_select "input#user_attachment_user_id[name=?]", "user_attachment[user_id]"
      assert_select "input#user_attachment_image[name=?]", "user_attachment[image]"
    end
  end
end
