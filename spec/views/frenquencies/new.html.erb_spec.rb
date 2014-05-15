require 'spec_helper'

describe "frenquencies/new" do
  before(:each) do
    assign(:frenquency, stub_model(Frenquency,
      :value => "MyString"
    ).as_new_record)
  end

  it "renders new frenquency form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", frenquencies_path, "post" do
      assert_select "input#frenquency_value[name=?]", "frenquency[value]"
    end
  end
end
