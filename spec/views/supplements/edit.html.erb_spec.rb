require 'spec_helper'

describe "supplements/edit" do
  before(:each) do
    @supplement = assign(:supplement, stub_model(Supplement,
      :name => "MyString",
      :default_dose => "MyString",
      :default_frequency => "MyString"
    ))
  end

  it "renders the edit supplement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", supplement_path(@supplement), "post" do
      assert_select "input#supplement_name[name=?]", "supplement[name]"
      assert_select "input#supplement_default_dose[name=?]", "supplement[default_dose]"
      assert_select "input#supplement_default_frequency[name=?]", "supplement[default_frequency]"
    end
  end
end
