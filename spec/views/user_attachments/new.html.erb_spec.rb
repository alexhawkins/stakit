require 'spec_helper'

describe "user_attachments/new" do
  before(:each) do
    assign(:user_attachment, stub_model(UserAttachment,
      :user_id => 1,
      :image => "MyString"
    ).as_new_record)
  end

  it "renders new user_attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_attachments_path, "post" do
      assert_select "input#user_attachment_user_id[name=?]", "user_attachment[user_id]"
      assert_select "input#user_attachment_image[name=?]", "user_attachment[image]"
    end
  end
end
